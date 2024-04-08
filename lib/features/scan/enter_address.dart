import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:krypt/features/components/shared/app_button.dart';
import 'package:krypt/features/components/shared/custom_app_bar.dart';
import 'package:krypt/features/components/shared/custom_text_field.dart';
import 'package:krypt/util/routing/app_router.dart';

@RoutePage(name: "EnterAddressRoute")
class EnterAddress extends StatelessWidget {
  EnterAddress({super.key});

  final _addressTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              controller: _addressTextController,
              hintText: "Email Recipients Address",
              keyboardType: TextInputType.emailAddress,
            ),
            const Spacer(),
            AppButton(
              title: 'Next',
              height: 56,
              onPress: () {
                context.router.push(EnterAmountRoute());
              },
            )
          ],
        ),
      ),
    );
  }
}
