import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:odc_workshop/business_logic/auth/login/login_cubit.dart';
import 'package:odc_workshop/constants/constant_methods.dart';
import 'package:odc_workshop/presentation/screens/app_layout/app_layout.dart';
import 'package:odc_workshop/presentation/screens/register/register_screen.dart';
import 'package:odc_workshop/presentation/styles/app_colors.dart';
import 'package:odc_workshop/presentation/widgets/default_text.dart';
import 'package:odc_workshop/presentation/widgets/default_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          flutterToast(msg: 'Logged in Successfully', color: Colors.grey);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const AppLayout(),
              ),
              (route) => false);
        }
      },
      builder: (context, state) {
        LoginCubit loginCubit = LoginCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Form(
              key: loginKey,
              child: ListView(
                children: [
                  //Text Orange Digtail Center
                  Center(
                    heightFactor: 0.5.h,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Orange",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 4.h,
                              )),
                          TextSpan(
                              text: " Digtal Center",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 4.h,
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.1.h,
                  ),

                  //text Login
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),

                  // E- mail
                  DefaultTextFormField(
                    validation: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Email';
                      } else if (!RegExp(
                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]")
                          .hasMatch(value)) {
                        return 'Your E-Mail is incorrect';
                      }
                    },
                    onChanged: () {},
                    hintText: 'Email',
                    isObscureText: false,
                    controller: emailController,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),

                  //password
                  DefaultTextFormField(
                    validation: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Password';
                      }else {
                        return "Your password is incorrect";
                      }
                    },
                    onChanged: () {},
                    isPasswordField: true,
                    isObscureText: true,
                    hintText: 'Password',
                    controller: passwordController,
                  ),

                  // Forget password
                  SizedBox(height: 2.h),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 23.h, top: 0.1.h, bottom: 0.h, right: 0.h),
                    child: Material(
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return RegisterScreen();
                          }));
                        },
                        child: Text(
                          "Forgest password..?",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 12.sp,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Button Login
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: ElevatedButton(
                      onPressed: () {
                        if (loginKey.currentState!.validate()) {
                          loginCubit.postLogin(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: AppColors.primaryColor,
                        padding: EdgeInsets.all(2.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.h),
                          side: BorderSide(
                              width: 3, color: AppColors.primaryColor),
                        ),
                      ),
                      child: Text(
                        'LogIn',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // Line between Login and SigUp
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.h),
                        child: Container(
                          height: 0.1.h,
                          width: 17.h,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "OR",
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      VerticalDivider(),
                      Container(
                        height: 0.1.h,
                        width: 17.h,
                        color: Colors.black,
                      ),
                    ],
                  ),

                  //Button SigUp
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        onPrimary: AppColors.primaryColor,
                        primary: Colors.white,
                        padding: EdgeInsets.all(2.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.h),
                          side: BorderSide(
                              width: 3, color: AppColors.primaryColor),
                        ),
                      ),
                      child: Text(
                        'SigUp',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
