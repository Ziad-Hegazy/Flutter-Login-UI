import 'package:flutter_application_1/styles/colors.dart';
import 'package:flutter_application_1/styles/font.dart';

import '/widgets/register_bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../widgets/login_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          toolbarHeight: 350,
          title: Center(
            child: Image.asset('assets/images/Illustration.png'),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome',
                style: AppTextStyles.mainTitle,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
                style: AppTextStyles.mainText,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 60,
              ),
              FilledButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                        context: context,
                        builder: (context) => const RegisterBottomSheet());
                  },
                  child: const Text("Create Account")),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                        context: context,
                        builder: (context) => const LoginBottomSheet());
                  },
                  child: const Text("Login")),
                  SizedBox(height: 40,),
              Text(
                'All Rights Reserved @2021',
                style: AppTextStyles.small,
              ),
            ],
          ),
        ));
  }
}
