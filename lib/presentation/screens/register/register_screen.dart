import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:odc_workshop/business_logic/auth/register/register_cubit.dart';
import 'package:odc_workshop/presentation/screens/login/login_screen.dart';
import 'package:odc_workshop/presentation/styles/app_colors.dart';
import 'package:odc_workshop/presentation/widgets/default_text.dart';
import 'package:odc_workshop/presentation/widgets/default_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();

  List<DropdownMenuItem<String>> genderMenu = const [
    DropdownMenuItem(
      value: 'm',
      child: Text('Male'),
    ),
    DropdownMenuItem(
      value: 'f',
      child: Text('Female'),
    ),
  ];
  String gender = 'm';

  void changeGender(val) {
    gender = val;
  }

  var genderSelected = "Select gender";

  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = RegisterCubit.get(context);
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Form(
              key: registerKey,
              child: ListView(
                children: [
                  //Text Orange Digtail Center
                  Center(
                    heightFactor: 0.2.h,
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
                    height: 4.h,
                  ),

                  ///text Regist
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.5.h),
                    child: Text(
                      "Regist",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),

                  ///Name
                  DefaultTextFormField(
                    validation: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Name';
                      } else if (value.length > 32) {
                        return 'Name Must be less than 32 characters';
                      }
                    },
                    onChanged: () {},
                    hintText: 'Name',
                    isObscureText: false,
                    controller: nameController,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),

                  ///E-Mail
                  DefaultTextFormField(
                    validation: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Email';
                      } else if (!RegExp(
                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]")
                          .hasMatch(value)) {
                        return 'Please Enter Valid as example@gmail.com';
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

                  ///Password
                  DefaultTextFormField(
                    validation: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Password';
                      }
                    },
                    onChanged: () {},
                    isPasswordField: true,
                    isObscureText: true,
                    hintText: 'Password',
                    controller: passwordController,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),

                  ///Confirm Password
                  DefaultTextFormField(
                    validation: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Confirm Password';
                      }
                    },
                    onChanged: () {},
                    isPasswordField: true,
                    isObscureText: true,
                    hintText: 'Confirm Password',
                    controller: confirmPasswordController,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),

                  ///Phone Number
                  DefaultTextFormField(
                    validation: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Phone Number';
                      } else if (value.length != 11) {
                        return "Phone Number Must be 11 Number";
                      }
                    },
                    onChanged: () {},
                    hintText: 'Phone Number',
                    isObscureText: false,
                    controller: phoneNumberController,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),

                  ///Gender
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultText(
                        text: 'Gender',
                        fontSize: 15.sp,
                      ),
                      Container(
                        height: 5.h,
                        width: 50.w,
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.sp),
                            border: Border.all(
                                color: Colors.deepOrange, width: 2.sp)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            onChanged: (value) {
                              registerCubit.changeGender(value);
                            },
                            value: registerCubit.gender,
                            items: genderMenu,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),

                  //Button Register
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.1.h),
                    child: ElevatedButton(
                      onPressed: () {
                        if (registerKey.currentState!.validate()) {
                          registerCubit.postRegister(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              phoneNumber: phoneNumberController.text,
                              gender:
                                  registerCubit.gender == 'male' ? 'm' : 'f');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        onPrimary: AppColors.primaryColor,
                        primary: Colors.white,
                        padding: EdgeInsets.all(1.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.h),
                          side: BorderSide(
                              width: 3, color: AppColors.primaryColor),
                        ),
                      ),
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  /// Line between Login and SigUp
                  SizedBox(
                    height: 1.h,
                  ),
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
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      VerticalDivider(),
                      Container(
                        height: 0.1.h,
                        width: 17.h,
                        color: Colors.black,
                      ),
                    ],
                  ),

                  //Button Login
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                            (route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: AppColors.primaryColor,
                        padding: EdgeInsets.all(1.h),
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
                  SizedBox(
                    height: 2.h,
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
