import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optilife/core/authentication/firebase_authentication.dart';
import 'package:optilife/core/widgets/button_widget.dart';
import 'package:optilife/core/widgets/textbox_widget.dart';
import 'package:optilife/core/navigation/routes.dart' as route;

class SigninScreen extends ConsumerStatefulWidget {
  const SigninScreen({super.key});

  @override
  ConsumerState<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends ConsumerState<SigninScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? errorMessage = '';
  final bool isLogin = true;

  // handleSubmit() async {
  //   if (_formKey.currentState!.validate()) {
  //     final email = _emailController.text.trim();
  //     final password = _passwordController.text.trim();
  //     if (isLogin) {
  //       await AuthService()
  //           .signInWithEmailAndPassword(email: email, password: password);
  //     } else {
  //       await AuthService()
  //           .registerWithEmailAndPassword(email: email, password: password);
  //     }
  //   }
  // }

  Future<void> signInWithEmailAndPassword() async {
    try {
      await AuthService().signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await AuthService().registerWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: LayoutBuilder(builder:
              (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Text(
                            'Sign In',
                            style: TextStyle(fontSize: 38),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: deviceHeight * 0.05,
                              ),
                              SizedBox(
                                child: TextBoxWidget(
                                  controller: _emailController,
                                  hint: 'Email',
                                  textInputType: TextInputType.emailAddress,
                                ),
                              ),
                              SizedBox(
                                height: deviceHeight * 0.05,
                              ),
                              SizedBox(
                                child: TextBoxWidget(
                                  controller: _passwordController,
                                  hint: 'Password',
                                  isPassword: false,
                                  maxLines: 1,
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Please enter your password';
                                  //   }
                                  //   return value;
                                  // },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: deviceHeight * 0.1,
                          ),
                          ButtonWidget(
                            text: 'Continue',
                            backgroundColor: Colors.white60,
                            onPressed: () {
                              // Navigator.of(context).pushNamed(route.signUp);
                              // handleSubmit();
                              isLogin
                                  ? signInWithEmailAndPassword()
                                  : createUserWithEmailAndPassword();
                            },
                          ),
                          SizedBox(
                            height: deviceHeight * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Don\'t have an account yet?'),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(route.signUp);
                                },
                                child: const Text(
                                  'SignUp',
                                  style: TextStyle(
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
