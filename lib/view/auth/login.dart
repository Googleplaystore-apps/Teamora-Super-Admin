import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:teamora/components/app_colors.dart';
import 'package:teamora/components/app_text.dart';
import 'package:teamora/components/textfield.dart';
import 'package:teamora/view/home/homescreen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController econtroller = TextEditingController();

  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.boxbg,
      body: Center(
        child: Container(
          height: 60.h,
          width: 300,
          padding: EdgeInsets.all(3.h),
          decoration: BoxDecoration(
            color: AppColors.boxbg,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.grey.withOpacity(0.5),
                blurRadius: 10,
                // offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              Image.asset('assets/images/logo.png',height: 7.h,),
              SizedBox(height: 2.h,),
              CustomText(text: "Welcome back!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,letterSpacing: 1)),
              CustomText(text: "Sign in to continue to Teamora", style: TextStyle(fontSize: 11, color: AppColors.grey)),
              SizedBox(height: 3.h,),
              Container(
                height: 5.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey.withOpacity(0.5), width: 0.5),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.security_sharp,size: 12,),
                    SizedBox(width: 1.h,),
                    CustomText(text: "Super Admin", 
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,)),
                  ],
                )),
              ),
              SizedBox(height: 2.h,),
              
              CustomTextField(
                label: "Email Address",
                prefixIcon: Icon(Icons.email_outlined,size: 12,),
                controller: econtroller, hintText: "Email"),
              SizedBox(height: 2.h,),
              CustomTextField(
                label: "Password",
                prefixIcon: Icon(Icons.lock_outline,size: 12,),
                controller: econtroller, hintText: "Password", isPassword: true),
              Expanded(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          checked = !checked;
                        });
                      },
                      child: Icon(checked ? Icons.check_box : Icons.check_box_outline_blank,size: 14,)),
                    SizedBox(width: 1.h,),
                    CustomText(text: "Remember me", style: TextStyle(fontSize: 12, color: AppColors.grey)),
                      Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: CustomText(text: "Forgot Password?", style: TextStyle(fontSize: 12, color: AppColors.primary), textAlign: TextAlign.end)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(context, 
                  MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
                },
                child: Container(
                  height: 5.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(text: "Access Admin Dashboard  ", style: TextStyle(fontSize: 12, color: Colors.white,)),
                      Icon(Icons.arrow_forward,size: 12, color: Colors.white,),
                    ],
                  )),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}