import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/utils/app_secure_storage.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/core/widget/main_text_field.dart';
import 'package:ecommerce_app/core/widget/validators.dart';
import 'package:ecommerce_app/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../api/model/requests/login_request.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../view_models/cubit/login_view_model.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginViewModel>(),
      child: BlocConsumer<LoginViewModel, LoginViewModelState>(
        listener: (context, state) {
          switch (state) {
            case LoginViewModelSuccess():
              {
                AppSecureStorage.setToken(state.authResponse.token!);
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.mainRoute, (route) => false);
              }

              break;
            case LoginViewModelInitial():
              return;
            case LoginViewModelLoading():
              showDialog(
                  context: context,
                  builder: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ));
              break;
            case LoginViewModelError():
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Error while login')));
              break;
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorManager.primary,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p20),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppSize.s40.h,
                        ),
                        Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                        SizedBox(
                          height: AppSize.s40.h,
                        ),
                        Text(
                          'Welcome Back To Route',
                          style: getBoldStyle(color: ColorManager.white)
                              .copyWith(fontSize: FontSize.s24.sp),
                        ),
                        Text(
                          'Please sign in with your mail',
                          style: getLightStyle(color: ColorManager.white)
                              .copyWith(fontSize: FontSize.s16.sp),
                        ),
                        SizedBox(
                          height: AppSize.s50.h,
                        ),
                        BuildTextField(
                          backgroundColor: ColorManager.white,
                          hint: 'enter your name',
                          label: 'User name',
                          controller: _emailController,
                          textInputType: TextInputType.emailAddress,
                          validation: AppValidators.validateEmail,
                        ),
                        SizedBox(
                          height: AppSize.s28.h,
                        ),
                        BuildTextField(
                          hint: 'enter your password',
                          backgroundColor: ColorManager.white,
                          label: 'Password',
                          controller: _passwordController,
                          validation: AppValidators.validatePassword,
                          isObscured: true,
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(
                          height: AppSize.s8.h,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Forget password?',
                                  style:
                                      getMediumStyle(color: ColorManager.white)
                                          .copyWith(fontSize: FontSize.s18.sp),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: AppSize.s60.h,
                        ),
                        Center(
                          child: SizedBox(
                            // width: MediaQuery.of(context).size.width * .8,
                            child: CustomElevatedButton(
                              // borderRadius: AppSize.s8,
                              isStadiumBorder: false,
                              label: 'Login',
                              backgroundColor: ColorManager.white,
                              textStyle: getBoldStyle(
                                  color: ColorManager.primary,
                                  fontSize: AppSize.s18),
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<LoginViewModel>().login(
                                      LoginRequest(
                                          email: _emailController.text,
                                          password: _passwordController.text));
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don’t have an account?',
                              style: getSemiBoldStyle(color: ColorManager.white)
                                  .copyWith(fontSize: FontSize.s16.sp),
                            ),
                            SizedBox(
                              width: AppSize.s8.w,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, Routes.signUpRoute),
                              child: Text(
                                'Create Account',
                                style:
                                    getSemiBoldStyle(color: ColorManager.white)
                                        .copyWith(fontSize: FontSize.s16.sp),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  login() {}
}
