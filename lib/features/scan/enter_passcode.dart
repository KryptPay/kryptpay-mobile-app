import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:krypt/features/components/shared/app_button.dart';
import 'package:krypt/features/components/shared/custom_app_bar.dart';
import 'package:krypt/util/app_icons.dart';
import 'package:krypt/util/extension_functions.dart';
import 'package:krypt/util/theme/colors.dart';

@RoutePage(name: "EnterPasscodeRoute")
class EnterPasscode extends StatelessWidget {
  const EnterPasscode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter Passcode',
              style: context.textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Enter the your passcode to confirm this transaction.',
              style: context.textTheme.bodySmall,
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 45,
              child: OtpTextField(
                crossAxisAlignment: CrossAxisAlignment.center,
                numberOfFields: 6,
                borderColor: grey500,
                focusedBorderColor: appYellow,
                showFieldAsBox: true,
                borderWidth: 2.0,
                fieldWidth: 45,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                textStyle: const TextStyle(
                  fontSize: 14,
                ),
                obscureText: false,
                onCodeChanged: (String code) {
                  // controller.otp = code;
                },
                onSubmit: (String verificationCode) {
                  // controller.otp = verificationCode;
                  // controller.goToCompanyScreen(context);
                },
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  (AppIcons.icQrCodeScanner as SvgPicture).copyWith(
                    assetName: "assets/icons/ic_face_icon.svg",
                    color: grey600,
                  ),
                  Text(
                    'Use FaceID',
                    style: context.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Spacer(),
            AppButton(
              title: "Confirm",
              onPress: () {},
              height: 56,
            ),
          ],
        ),
      ),
    );
  }
}
