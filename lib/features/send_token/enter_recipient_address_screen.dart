import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:krypt/features/components/shared/app_button.dart';
import 'package:krypt/features/components/shared/custom_app_bar.dart';
import 'package:krypt/features/components/shared/custom_text_field.dart';
import 'package:krypt/util/app_icons.dart';
import 'package:krypt/util/extension_functions.dart';
import 'package:krypt/util/routing/app_router.dart';
import 'package:krypt/util/theme/colors.dart';

@RoutePage(name: "EnterRecipientAddressScreenRoute")
class EnterRecipientAddressScreen extends StatelessWidget {
  EnterRecipientAddressScreen({super.key});

  final _recipientAddressTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Send",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 30.0),
              CustomTextField(
                controller: _recipientAddressTextController,
                hintText: "Enter recipients address",
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(child: Divider(color: grey200)),
                  const SizedBox(width: 20),
                  Text(
                    "or",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18.0, color: grey500),
                  ),
                  const SizedBox(width: 20),
                  const Expanded(child: Divider(color: grey200)),
                ],
              ),
              const SizedBox(height: 20.0),
              InkWell(
                onTap: (){
                  context.router.push(const ScanToPayRoute());
                },
                child: (AppIcons.icQrCodeScanner as SvgPicture).copyWith(
                  assetName: "assets/icons/ic_qr_code.svg",
                  color: grey600,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                "Scan QR Code",
                style: context.textTheme.bodySmall?.copyWith(fontSize: 12.0, color: const Color(0xFF6B7180)),
              ),
              const Spacer(),
              AppButton(
                title: "Next",
                onPress: () {
                  context.router.push(const EnterAmountToSendScreenRoute());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
