import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/colors.dart';
import 'package:flutter_application_1/styles/font.dart';
import 'package:flutter_application_1/styles/theme.dart';
import 'package:flutter_application_1/widgets/login_bottom_sheet.dart';
import '../controllers/user_controller.dart';

class RegisterBottomSheet extends StatefulWidget {
  const RegisterBottomSheet({super.key});

  @override
  State<RegisterBottomSheet> createState() => _RegisterBottomSheetState();
}

class _RegisterBottomSheetState extends State<RegisterBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
   final _courseController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _userController = UserController();
  bool _obscureUsername = true;
  bool _obscureCourse = true;
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
  String? _validateConfirmPassword(String? value) {
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _submit() {
    if (_formKey.currentState!.validate() ?? false) {
      final user = _userController.createUser(
          _usernameController.text, _passwordController.text);
      print("registered as ${user.username}");
      Navigator.pop(context);
    } else {
      print("Register Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [Padding(
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
                        Text(style: AppTextStyles.sheetText, 'Hello...'),
                        SizedBox(
                          height: 1,
                        ),
                        Text(style: AppTextStyles.sheetTitle, 'Register'),
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
                  obscureText: _obscureCourse,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        _obscureCourse = !_obscureCourse;
                        setState(() {});
                      },
                      icon: _obscureCourse
                          ? Icon(Icons.visibility_off_outlined,
                              color: AppColors.primary)
                          : Icon(
                              Icons.visibility_outlined,
                              color: AppColors.primary,
                            ),
                    ),
                    labelText: "Course",
                  ),
                  controller: _courseController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Course is required";
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
                  height: 15,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "confirm password",
                      suffixIcon: Icon(
                        Icons.lock_outlined,
                        color: Colors.black54,
                      )),
                  controller: _confirmPasswordController,
                  validator: _validateConfirmPassword,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: _submit,
                  child: const Text("Register"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have acoount?",
                      style: AppTextStyles.sheetText,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => LoginBottomSheet());
                        },
                        child: Text(
                          'Login',
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
