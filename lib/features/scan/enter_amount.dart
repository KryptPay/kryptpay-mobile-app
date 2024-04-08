import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:krypt/features/components/shared/app_button.dart';
import 'package:krypt/features/components/shared/custom_app_bar.dart';
import 'package:krypt/features/components/shared/custom_text_field.dart';
import 'package:krypt/util/extension_functions.dart';
import 'package:krypt/util/routing/app_router.dart';
import 'package:krypt/util/theme/colors.dart';

@RoutePage(name: "EnterAmountRoute")
class EnterAmount extends StatelessWidget {
  EnterAmount({super.key});

  final _addressTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _addressTextController.text = 'Hdhfh...jfjd';
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter Amount',
              style: context.textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Send to',
              style: context.textTheme.bodySmall,
            ),
            CustomTextField(
              suffixIcon: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {},
              ),
              controller: _addressTextController,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(
              height: 16,
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              shape: const RoundedRectangleBorder(
                  side: BorderSide(width: 0.2),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              title: Text(
                'USDC',
                style: context.textTheme.bodyLarge,
              ),
              subtitle: Text(
                'Bal: 586654121',
                style: context.textTheme.bodySmall,
              ),
              trailing: Column(
                children: [
                  Text(
                    '0',
                    style: context.textTheme.bodyLarge,
                  ),
                  const Spacer(),
                  Text(
                    '~N0',
                    style: context.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const Spacer(),
            AppButton(
              title: "Next",
              onPress: () {
                context.router.push(const EnterPasscodeRoute());
              },
              height: 56,
            ),
          ],
        ),
      ),
    );
  }
}
