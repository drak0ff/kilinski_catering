import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_catering/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:happy_catering/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:happy_catering/screens/auth/components/happy_catering_text_field.dart';
import 'package:happy_catering/screens/auth/components/reg_ex.dart';
import 'package:user_repository/user_repository.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  IconData iconPassword = CupertinoIcons.eye_fill;

  bool obscurePassword = true;
  bool signUpRequired = false;
  bool containsUpperCase = false;
  bool containsLowerCase = false;
  bool containsNumber = false;
  bool containsSpecialChar = false;
  bool contains8Length = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if(state is SignUpSuccess) {
              setState(() {
                signUpRequired = false;
              });
              // Navigator.pop(context);
            } else if(state is SignUpProcess) {
              setState(() {
                signUpRequired = true;
              });
            }  else if(state is SignUpFailure) {
              return;
            } 
          },
        child: Form(
            key: _formKey,
            child: Center(
                child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(height: 20),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: HappyCateringTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(CupertinoIcons.mail),
                      validator: (str) {
                        if (str!.isEmpty) {
                          return 'Please, fill in this field';
                        } else if (!emailRegExp.hasMatch(str)) {
                          return 'Please, enter a valid email';
                        } else {
                          return null;
                        }
                      },
                    )),
                const SizedBox(height: 10),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: HappyCateringTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: obscurePassword,
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: const Icon(CupertinoIcons.lock),
                      onChanged: (val) {
                        if (val!.contains(RegExp(r'[A-Z]'))) {
                          setState(() {
                            containsUpperCase = true;
                          });
                        } else {
                          setState(() {
                            containsUpperCase = false;
                          });
                        }
                        if (val.contains(RegExp(r'[a-z]'))) {
                          setState(() {
                            containsLowerCase = true;
                          });
                        } else {
                          setState(() {
                            containsLowerCase = false;
                          });
                        }
                        if (val.contains(RegExp(r'[0-9]'))) {
                          setState(() {
                            containsNumber = true;
                          });
                        } else {
                          setState(() {
                            containsNumber = false;
                          });
                        }
                        if (val.contains(RegExp(
                            r'^(?=.*?[!@#$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^])'))) {
                          setState(() {
                            containsSpecialChar = true;
                          });
                        } else {
                          setState(() {
                            containsSpecialChar = false;
                          });
                        }
                        if (val.length >= 8) {
                          setState(() {
                            contains8Length = true;
                          });
                        } else {
                          setState(() {
                            contains8Length = false;
                          });
                        }
                        return null;
                      },
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                            if (obscurePassword) {
                              iconPassword = CupertinoIcons.eye;
                            } else {
                              iconPassword = CupertinoIcons.eye_slash;
                            }
                          });
                        },
                        icon: Icon(
                          iconPassword,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      validator: (str) {
                        if (str!.isEmpty) {
                          return 'Please fill in this field';
                        } else if (!passwordRegExp.hasMatch(str)) {
                          return 'Please enter a valid password';
                        } else {
                          return null;
                        }
                      },
                    )),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "⚈ 1 uppercase",
                          style: TextStyle(
                              color: containsUpperCase
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.onBackground),
                        ),
                        Text(
                          "⚈ 1 lowercase",
                          style: TextStyle(
                              color: containsLowerCase
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.onBackground),
                        ),
                        Text(
                          "⚈ 1 number",
                          style: TextStyle(
                              color: containsNumber
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.onBackground),
                        ),
                      ],
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "⚈ 1 special character",
                            style: TextStyle(
                                color: containsSpecialChar
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                          ),
                          Text(
                            "⚈ 8 minimum characters",
                            style: TextStyle(
                                color: contains8Length
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                          ),
                        ]),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: HappyCateringTextField(
                      controller: nameController,
                      hintText: 'Name',
                      obscureText: false,
                      keyboardType: TextInputType.name,
                      prefixIcon: const Icon(CupertinoIcons.person),
                      validator: (str) {
                        if (str!.isEmpty) {
                          return 'Please fill in this field';
                        } else if (str.length > 30) {
                          return 'Name is too long';
                        } else {
                          return null;
                        }
                      },
                    )),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: HappyCateringTextField(
                      controller: surnameController,
                      hintText: 'Surname',
                      obscureText: false,
                      keyboardType: TextInputType.name,
                      prefixIcon: const Icon(CupertinoIcons.person),
                      validator: (str) {
                        if (str!.isEmpty) {
                          return 'Please fill in this field';
                        } else if (str.length > 30) {
                          return 'Surname is too long';
                        } else {
                          return null;
                        }
                      },
                    )),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: HappyCateringTextField(
                    controller: phoneController,
                    hintText: 'Phone',
                    obscureText: false,
                    keyboardType: TextInputType.phone,
                    prefixIcon: const Icon(CupertinoIcons.phone),
                    validator: (str) {
                      if (str!.isEmpty) {
                        return 'Please fill in this field';
                      } else if (str.length < 11 || str.length > 13) {
                        return 'Please, enter correct number length';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                !signUpRequired
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              MyUser myUser = MyUser.empty;
                              myUser = myUser.copyWith(
                                  email: emailController.text,
                                  name: nameController.text,
                                  surname: surnameController.text,
                                  phone: phoneController.text);
                              setState(() {
                                context.read<SignUpBloc>().add(SignUpRequired(
                                    myUser, passwordController.text));
                              });
                            }
                          },
                          style: TextButton.styleFrom(
                              elevation: 3.0,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60),
                              )),
                          child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 5),
                              child: Text('Sign up',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600))),
                        ))
                    : const CircularProgressIndicator()
              ]
            ),
          )
        )
      )
    );
  }
}
