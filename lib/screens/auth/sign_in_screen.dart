import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_catering/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:happy_catering/screens/auth/components/happy_catering_text_field.dart';
import 'package:happy_catering/screens/auth/components/reg_ex.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool signInRequired = false;
  late IconData passwordIcon = CupertinoIcons.eye_fill;
  bool obscurePassword = true;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: HappyCateringTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(
                  CupertinoIcons.mail,
                ),
                errorMessage: _errorMessage,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please, fill in this field';
                  } else if (!emailRegExp.hasMatch(val)) {
                    return 'Please, enter a valid email';
                  }
                  return null;
                },
              )),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: HappyCateringTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: obscurePassword,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: const Icon(CupertinoIcons.lock),
                errorMessage: _errorMessage,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please fill in this field';
                  } else if (!passwordRegExp.hasMatch(val)) {
                    return 'Please enter a valid password';
                  } else {
                    return null;
                  }
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                      if (obscurePassword) {
                        passwordIcon = CupertinoIcons.eye_fill;
                      } else {
                        passwordIcon = CupertinoIcons.eye_slash;
                      }
                    });
                  },
                  icon: Icon(
                    passwordIcon,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          !signInRequired
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<SignInBloc>().add(SignInRequired(
                          emailController.text, 
                          passwordController.text)
                          );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sign In'),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ))
              : const CircularProgressIndicator(),
        ]));
  }
}