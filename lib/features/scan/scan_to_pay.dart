import 'dart:developer';

import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:krypt/features/components/shared/app_button.dart';
import 'package:krypt/features/components/shared/custom_app_bar.dart';
import 'package:krypt/util/extension_functions.dart';
import 'package:krypt/util/routing/app_router.dart';
import 'package:krypt/util/theme/colors.dart';

@RoutePage(name: "ScanToPayRoute")
class ScanToPay extends StatefulWidget {
  const ScanToPay({super.key});

  @override
  State<ScanToPay> createState() => _ScanToPayState();
}

class _ScanToPayState extends State<ScanToPay> {
  @override
  Widget build(BuildContext context) {
    String barcode = 'Tap  to scan';
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Scan to Pay',
              style: context.textTheme.bodyLarge,
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              height: size.height / 1.9,
              width: size.width - 16,
              child: AiBarcodeScanner(
                errorColor: Colors.red,
                overlayColor: Colors.white,
                borderRadius: 16,
                borderColor: Colors.black,
                cutOutSize: 500,
                borderWidth: 5,
                bottomBar: const SizedBox.shrink(),
                onScan: (String value) {
                  debugPrint(value);
                  if (barcode.contains('https://')) {
                    context.router.push(EnterAmountRoute());
                  }
                  setState(() {
                    barcode = value;
                    log('message $barcode');


                  });
                },

                canPop: false,
                // validator: (value) {
                //
                //
                //   return value.startsWith('https://');
                // },
                onDetect: (p0) {},
                onDispose: () {
                  debugPrint("Barcode scanner disposed!");
                },
                // controller: MobileScannerController(
                //   detectionSpeed: DetectionSpeed.noDuplicates,
                // ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                color: grey300,
                border: Border.all(color: grey500),
              ),
              child: Text(
                  style: context.textTheme.bodySmall,
                  "Position your phone to make sure the QR code is within the camera frame."),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Flexible(
                    child: AppOutlinedButton(
                      borderRadius: 30,
                      height: 56,
                      title: "Enter address",
                      onPress: () {
                        context.router.push(EnterAddressRoute());
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  Flexible(
                    child: AppButton(
                      title: "Scan",
                      onPress: () {},
                      height: 56,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
