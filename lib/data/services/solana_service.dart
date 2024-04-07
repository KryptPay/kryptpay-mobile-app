import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:krypt/util/logging/app_logger.dart';
import 'package:solana/encoder.dart';
import 'package:solana/solana.dart';
import 'package:solana_mobile_client/solana_mobile_client.dart';
import 'package:http/http.dart' as http;

@Singleton()
class SolanaService {
  final SolanaClient _solanaClient;

  SolanaService(this._solanaClient);

  AuthorizationResult? _authorizationResult;

  Future<bool> isWalletAvailable() => LocalAssociationScenario.isAvailable();

  Future<(Ed25519HDPublicKey, String)> createSolanaAccount() async {
    // Generate a new keypair
    final keyPair = await Ed25519HDKeyPair.random();

    // Get the public key
    final publicKey = keyPair.publicKey;

    // Print the public key (for demonstration purposes)
    AppLogger.debug('Public Key: $publicKey');

    return (keyPair.publicKey, keyPair.address);
  }

  Future<void> signAndSendTransactions(int number, Ed25519HDPublicKey publicKey) async {
    final session = await LocalAssociationScenario.create();

    session.startActivityForResult(null).ignore();

    final client = await session.start();
    if (await _doReauthorize(client)) {
      final blockhash = await _solanaClient.rpcClient.getLatestBlockhash().then((it) => it.value.blockhash);
      final txs = _generateTransactions(
        number: number,
        signer: publicKey,
        blockhash: blockhash,
      ).map((e) => e.toByteArray().toList()).map(Uint8List.fromList).toList();

      await client.signAndSendTransactions(transactions: txs);
    }
    await session.close();
  }

  List<SignedTx> _generateTransactions({
    required int number,
    required Ed25519HDPublicKey signer,
    required String blockhash,
  }) {
    final instructions = List.generate(
      number,
      (index) => MemoInstruction(signers: [signer], memo: 'Memo #$index'),
    );
    final signature = Signature(List.filled(64, 0), publicKey: signer);

    return instructions
        .map(Message.only)
        .map(
          (e) => SignedTx(
            compiledMessage: e.compile(recentBlockhash: blockhash, feePayer: signer),
            signatures: [signature],
          ),
        )
        .toList();
  }

  Future<void> authorizeAndSignTransactions(Ed25519HDPublicKey publicKey) async {
    final session = await LocalAssociationScenario.create();

    session.startActivityForResult(null).ignore();

    final client = await session.start();
    if (await _doAuthorize(client)) {
      await _doGenerateAndSignTransactions(client, 1, publicKey);
    }
    await session.close();
  }

  Future<void> _doGenerateAndSignTransactions(
    MobileWalletAdapterClient client,
    int number,
    Ed25519HDPublicKey publicKey,
  ) async {
    final blockhash = await _solanaClient.rpcClient.getLatestBlockhash().then((it) => it.value.blockhash);
    final txs = _generateTransactions(
      number: number,
      signer: publicKey,
      blockhash: blockhash,
    ).map((e) => e.toByteArray().toList()).map(Uint8List.fromList).toList();

    await client.signTransactions(transactions: txs);
  }

  Future<bool> _doAuthorize(MobileWalletAdapterClient client) async {
    _authorizationResult = await client.authorize(
      identityUri: Uri.parse('https://solana.com'),
      iconUri: Uri.parse('favicon.ico'),
      identityName: 'Solana',
      cluster: 'testnet',
    );

    return _authorizationResult != null;
  }

  Future<bool> _doReauthorize(MobileWalletAdapterClient client) async {
    if (_authorizationResult == null) return false;

    _authorizationResult = await client.reauthorize(
      identityUri: Uri.parse('https://solana.com'),
      iconUri: Uri.parse('favicon.ico'),
      identityName: 'Solana',
      authToken: _authorizationResult!.authToken,
    );

    return _authorizationResult != null;
  }

  Future<String> fetchWalletBalance(String walletAddress) async {
    if (walletAddress.isEmpty) return "0.0";
    const String rpcUrl = 'https://api.devnet.solana.com'; // Solana Devnet RPC URL

    try {
      final response = await http.post(
        Uri.parse(rpcUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'jsonrpc': '2.0',
          'id': 1,
          'method': 'getBalance',
          'params': [walletAddress],
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        AppLogger.debug("fetchWalletBalance jsonResponse is $jsonResponse");
        final balance = jsonResponse['result']['value'];
        final solBalance = balance / 1000000000; // Convert lamports to SOL
        AppLogger.debug('Wallet balance: $solBalance SOL');
        return solBalance;
      } else {
        AppLogger.debug('Failed to fetch balance: ${response.statusCode}');
        return "0.0";
      }
      return "";
    } catch (error) {
      // Handle errors by updating the balance variable with an error message
      return "0.0";
    }
  }

  Future<void> requestAirdrop(Ed25519HDPublicKey publicKey) async {
    try {
      final String result = await _solanaClient.requestAirdrop(
        address: publicKey,
        lamports: lamportsPerSol,
      );
      AppLogger.debug("result from requesting airdrop is $result");
    } catch (exception, stackTrace) {
      AppLogger.error(exception, stackTrace);
    }
  }

  Future<void> requestOneSol(String walletAddress) async {
    // Solana Devnet faucet endpoint
    String faucetUrl = 'https://api.devnet.solana.com/request-airdrop';

    try {
      // Make a POST request to the Devnet faucet endpoint with the wallet address to request SOL
      http.Response response = await http.post(
        Uri.parse(faucetUrl),
        headers: {'Content-Type': 'application/json'},
        body:
            '{"jsonrpc":"2.0","id":1,"method":"requestAirdrop","params":["$walletAddress", 1000000000]}', // 1 SOL (1,000,000,000 lamports)
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Display a success message or handle the response data accordingly
        AppLogger.debug('1 SOL successfully requested for wallet address: $walletAddress');
      } else {
        // Display an error message if the request was not successful
        AppLogger.debug('Failed to request 1 SOL. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any errors that occur during the request
      AppLogger.debug('Error requesting 1 SOL: $error');
    }
  }
}
