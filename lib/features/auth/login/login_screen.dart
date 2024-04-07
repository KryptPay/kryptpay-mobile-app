import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krypt/di/injection.dart';
import 'package:krypt/features/auth/login/cubit/login_screen_cubit.dart';
import 'package:krypt/features/components/shared/app_button.dart';
import 'package:krypt/features/components/shared/custom_app_bar.dart';
import 'package:krypt/features/components/shared/custom_text_field.dart';
import 'package:krypt/util/app_icons.dart';
import 'package:krypt/util/extension_functions.dart';
import 'package:krypt/util/routing/app_router.dart';
import 'package:krypt/util/theme/colors.dart';
import 'package:krypt/util/validation_utils.dart';

@RoutePage(name: 'LoginScreenRoute')
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailTextController = TextEditingController();

  final _passwordTextController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final LoginScreenCubit _loginScreenCubit = getIt.get();

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginScreenCubit, LoginScreenState>(
      bloc: _loginScreenCubit,
      listener: (context, state) {
        state.maybeWhen(
          loginSuccessful: () => context.router.replaceAll([const DashboardScreenRoute()]),
          loginError: context.showSnackBar,
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: const CustomAppBar(
            leading: SizedBox(),
          ),
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 0, right: 15, left: 15),
                child: state.maybeWhen(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  orElse: () {
                    return Form(
                      key: _formKey,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Login",
                            style: context.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            controller: _emailTextController,
                            hintText: "Email",
                            keyboardType: TextInputType.emailAddress,
                            validator: ValidationUtils.isValidEmail,
                          ),
                          const SizedBox(height: 8),
                          CustomTextField(
                            controller: _passwordTextController,
                            hintText: "Password",
                            validator: ValidationUtils.isValidPassword,
                          ),
                          const SizedBox(height: 20),
                          AppButton(
                            title: "Login",
                            onPress: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                final String email = _emailTextController.text.trim();
                                final String password = _passwordTextController.text.trim();

                                final focusScope = FocusScope.of(context);

                                if (focusScope.hasFocus) {
                                  focusScope.unfocus();
                                }

                                _loginScreenCubit.loginUser(email: email, password: password);
                              }
                            },
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
                            onPress: () {

                            },
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don’t have an account?",
                                style: context.textTheme.bodySmall?.copyWith(color: const Color(0xFF6B7180)),
                              ),
                              const SizedBox(width: 4.0),
                              InkWell(
                                onTap: () => context.router.maybePop(),
                                child: Text(
                                  "Sign up",
                                  style: context.textTheme.bodySmall?.copyWith(color: const Color(0xFFD8A200)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
