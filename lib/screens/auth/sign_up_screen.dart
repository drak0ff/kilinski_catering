import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_catering/screens/auth/components/happy_catering_text_field.dart';
import 'package:happy_catering/screens/auth/components/reg_ex.dart';

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
  final numberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  IconData iconPassword = CupertinoIcons.eye_fill;
  bool obscurePassword = true;
  bool signUpRequired = true;
  bool containsUpperCase = false;
  bool containsLowerCase = false;
  bool containsNumber = false;
  bool containsSpecialChar = false;
  bool contains8Length = false;

  @override
  Widget build(BuildContext context) {
    return Form (
      key: _formKey,
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: HappyCateringTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(CupertinoIcons.mail),
                validator:(str) {
                  if(str!.isEmpty){
                    return 'Please, fill in this field';
                  }
                  else if (!passwordRegExp.hasMatch(str)) {
                    return 'Please, enter a valid email';
                  }
                  else { return null;}
                },
              )
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: HappyCateringTextField(
                controller: emailController,
                hintText: 'Password',
                obscureText: obscurePassword,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: const Icon(CupertinoIcons.lock),
                onChanged: (val) {
												if(val!.contains(RegExp(r'[A-Z]'))) {
													setState(() {
														containsUpperCase = true;
													});
												} else {
													setState(() {
														containsUpperCase = false;
													});
												}
												if(val.contains(RegExp(r'[a-z]'))) {
													setState(() {
														containsLowerCase = true;
													});
												} else {
													setState(() {
														containsLowerCase = false;
													});
												}
												if(val.contains(RegExp(r'[0-9]'))) {
													setState(() {
														containsNumber = true;
													});
												} else {
													setState(() {
														containsNumber = false;
													});
												}
												if(val.contains(RegExp(r'^(?=.*?[!@#$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^])'))) {
													setState(() {
														containsSpecialChar = true;
													});
												} else {
													setState(() {
														containsSpecialChar = false;
													});
												}
												if(val.length >= 8) {
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
                            if(obscurePassword) {
                              iconPassword = CupertinoIcons.eye;
                            }
                            else {
                              iconPassword = CupertinoIcons.eye_slash;
                            }
                          });
                        },
                        icon: Icon(iconPassword, color: Theme.of(context).colorScheme.secondary,),
                      ),
                      validator: (str) {
                        if(str!.isEmpty) {
                          return 'Please fill in this field';
                        }
                        else if (!passwordRegExp.hasMatch(str)) {
                          return 'Please enter a valid password';
                        }
                        else {return null; }
                      },
              )
            ),
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
                        : Theme.of(context).colorScheme.onBackground
                      ),
                    ),
                      Text(
                      "⚈ 1 lowercase",
                      style: TextStyle(
                        color: containsLowerCase
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onBackground
                      ),
                    ),  
                    Text(
                      "⚈ 1 number",
                      style: TextStyle(
                        color: containsNumber
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onBackground
                      ),
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
                        : Theme.of(context).colorScheme.onBackground
                      ),
                    ),
                      Text(
                      "⚈ 8 minimum characters",
                      style: TextStyle(
                        color: contains8Length
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onBackground
                      ),
                    ),
                  ]
                ),
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
                  if(str!.isEmpty) {
                    return 'Please fill in this field';
                  }
                  else if(str.length > 30) {
                    return 'Name is too long';
                  }
                  else { return null; }
                },
              )
            ),
            const SizedBox(height: 10,),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: HappyCateringTextField(
                controller: surnameController,
                hintText: 'Surname',
                obscureText: false,
                keyboardType: TextInputType.name,
                prefixIcon: const Icon(CupertinoIcons.person),
                validator: (str) {
                  if(str!.isEmpty) {
                    return 'Please fill in this field';
                  }
                  else if(str.length > 30) {
                    return 'Surname is too long';
                  }
                  else { return null; }
                },
              )
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2),
              !signUpRequired
              ? SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()) {
                    }
                  },
                  child: const Placeholder(),
                )
              )
              : const Placeholder()
          ]
        ),
      )
    );
  }
}
