import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krypt/di/injection.dart';
import 'package:krypt/features/auth/sign-up/cubit/sign_up_screen_cubit.dart';
import 'package:krypt/features/components/shared/app_button.dart';
import 'package:krypt/features/components/shared/custom_text_field.dart';
import 'package:krypt/util/app_icons.dart';
import 'package:krypt/util/extension_functions.dart';
import 'package:krypt/util/logging/app_logger.dart';
import 'package:krypt/util/routing/app_router.dart';
import 'package:krypt/util/theme/colors.dart';
import 'package:krypt/util/validation_utils.dart';

@RoutePage(name: "SignUpScreenRoute")
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailTextController = TextEditingController();

  final _passwordTextController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final SignUpScreenCubit _signUpScreenCubit = getIt.get();

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpScreenCubit, SignUpScreenState>(
      bloc: _signUpScreenCubit,
      listener: (context, state) {
        state.maybeWhen(
          error: context.showSnackBar,
          accountCreated: () => context.router.replace(SetUpPassCodeAuthorizationScreenRoute()),
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
              child: state.maybeWhen(
                loading: () => const Center(child: CircularProgressIndicator()),
                orElse: () {
                  return Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create an account',
                          style: context.textTheme.titleLarge,
                        ),
                        const SizedBox(height: 14),
                        Text(
                          'Enter a valid email address to create an\naccount.',
                          style: context.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: _emailTextController,
                          hintText: "Email address",
                          keyboardType: TextInputType.emailAddress,
                          validator: ValidationUtils.isValidEmail,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _passwordTextController,
                          hintText: "Password",
                          validator: ValidationUtils.isValidPassword,
                        ),
                        const SizedBox(height: 20),
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
                        const SizedBox(height: 20),
                        AppOutlinedButton(
                          startSpacing: 10.0,
                          startIcon: AppIcons.icGoogle,
                          title: "Sign up with Google",
                          onPress: () {},
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: context.textTheme.bodySmall?.copyWith(color: const Color(0xFF6B7180)),
                            ),
                            const SizedBox(width: 4.0),
                            InkWell(
                              onTap: () => context.router.push(const LoginScreenRoute()),
                              child: Text(
                                "Login",
                                style: context.textTheme.bodySmall?.copyWith(color: const Color(0xFFD8A200)),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        AppButton(
                          title: "Continue",
                          onPress: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              final String email = _emailTextController.text.trim();
                              final String password = _passwordTextController.text.trim();

                              final focusScope = FocusScope.of(context);

                              if (focusScope.hasFocus) {
                                focusScope.unfocus();
                              }

                              _signUpScreenCubit.createUserAccount(email: email, password: password);

                              AppLogger.debug("email is $email and password is $password");
                            }
                          },
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
