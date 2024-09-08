import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/colors.dart';
import 'package:flutter_application_1/styles/font.dart';
import 'package:flutter_application_1/styles/theme.dart';
import 'package:flutter_application_1/widgets/register_bottom_sheet.dart';

import '../controllers/user_controller.dart';

class LoginBottomSheet extends StatefulWidget {
  const LoginBottomSheet({super.key});

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  final _userController = UserController();
  bool _obscureUsername = true;
  bool _isRemember = false;
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  void _submit() {
    if (_formKey.currentState!.validate() ?? false) {
      final user = _userController.createUser(
          _usernameController.text, _passwordController.text);
      print("Login as ${user.username}");
      Navigator.pop(context);
    } else {
      print("Login Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 30,
          left: 30,
          right: 30,
        ),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(style: AppTextStyles.sheetText, 'Welcome Back!!!'),
                        SizedBox(
                          height: 1,
                        ),
                        Text(style: AppTextStyles.sheetTitle, 'Login'),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      icon: ImageIcon(
                        AssetImage('assets/images/close.png'),
                        color: AppColors.secondary,
                      ),
                    )
                  ],
                ),
                TextFormField(
                  obscureText: _obscureUsername,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        _obscureUsername = !_obscureUsername;
                        setState(() {});
                      },
                      icon: _obscureUsername
                          ? Icon(Icons.visibility_off_outlined,
                              color: AppColors.primary)
                          : Icon(
                              Icons.visibility_outlined,
                              color: AppColors.primary,
                            ),
                    ),
                    labelText: "username/email",
                  ),
                  controller: _usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "An email or a username is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Password",
                      suffixIcon: Icon(
                        Icons.lock_outlined,
                        color: Colors.black54,
                      )),
                  controller: _passwordController,
                  validator: _validatePassword,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                              value: _isRemember,
                              onChanged: (val) {
                                setState(() {
                                  _isRemember = val!;
                                });
                              }),
                          Text(
                            "Remember me",
                            style: AppTextStyles.small
                                .copyWith(color: AppColors.primary),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: AppTextStyles.small
                                .copyWith(color: AppColors.primary),
                          )),
                    ]),
                ElevatedButton(
                  onPressed: _submit,
                  child: const Text("Login"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an acoount?",
                      style: AppTextStyles.sheetText,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => RegisterBottomSheet());
                        },
                        child: Text(
                          'Register',
                          style: AppTextStyles.sheetTextButton,
                        ))
                  ],
                ),
              ],
            )),
      ),
    ]);
  }
}
