// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce/data/api/api_constants.dart';
import 'package:e_commerce/domain/dep_injections.dart';
import 'package:e_commerce/ui/screens/auth/login/login_screen.dart';
import 'package:e_commerce/ui/utils/my_colors.dart';
import 'package:e_commerce/ui/utils/my_shared_preferences.dart';
import 'package:e_commerce/ui/widgets/auth_button.dart';
import 'package:e_commerce/ui/widgets/auth_textform_field.dart';
import 'package:e_commerce/ui/widgets/dialog_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce/ui/screens/auth/register/cubit/register_screen_viewmodel.dart';

class ProfileTab extends StatelessWidget {
  final _viewModel =
      RegisterScreenViewModel(registerUseCase: injectRegisterUseCase());
  bool _isPasswordSecured = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: MyColors.blueColor,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/app_bar_logo.png'),
                IconButton(
                    onPressed: () {
                      DialogUtils.showMessage(
                        context,
                        title: "Sign Out",
                        content: "Do you really want to sign out?",
                        negActionName: "Yes",
                        negAction: () async {
                          DialogUtils.showLoading(context,
                              message: "Loading...");
                          MySharedPreferces.deleteData(
                              key: ApiConstants.userToken);
                          await Future.delayed(Durations.long2);
                          DialogUtils.hideLoading(context);
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            LoginScreen.routeName,
                            (Route<dynamic> route) => false,
                          );
                        },
                        posActionName: "Cancel",
                        posAction: () {},
                      );
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: MyColors.blueColor,
                    ))
              ],
            ),
            Container(
              color: MyColors.blueColor,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //SizedBox(height: 5),
                        Text(
                          'Welcome, Mohamed',
                          // style: getSemiBoldStyle(
                          //     color: ColorManager.primary, fontSize: FontSize.s18),
                        ),
                        Text(
                          'moh.abg@gmail.com',
                          // style: getRegularStyle(
                          //     color: ColorManager.primary.withOpacity(.5),
                          //     fontSize: FontSize.s14),
                        ),

                        AuthTextFormField(
                          controller: _viewModel.userNameController,
                          fieldTitle: "Full Name",
                          hintText: "enter your full name",
                        ),

                        AuthTextFormField(
                          controller: _viewModel.userPhoneNoController,
                          fieldTitle: "Mobile Number",
                          hintText: "enter your mobile no.",
                        ),

                        AuthTextFormField(
                          controller: _viewModel.userEmailController,
                          fieldTitle: "E-mail address",
                          hintText: "enter your email address",
                        ),

                        AuthTextFormField(
                          controller: _viewModel.uesrPasswordController,
                          fieldTitle: "Password",
                          hintText: "enter your password",
                          obscureText: _isPasswordSecured,
                          suffixIcon: IconButton(
                              icon: (_isPasswordSecured)
                                  ? const ImageIcon(AssetImage(
                                      'assets/images/eye_slash_icon.png'))
                                  : const ImageIcon(
                                      AssetImage('assets/images/eye_icon.png')),
                              onPressed: () {
                                // setState(() {
                                _isPasswordSecured = !_isPasswordSecured;
                                // });
                              }),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 50.h, bottom: 30.h),
                          child: AuthButton(
                              title: "Update Personal",
                              onPressed: () {
                                //  _viewModel.register();
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
