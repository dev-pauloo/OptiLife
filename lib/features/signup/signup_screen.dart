
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optilife/core/widgets/textbox_widget.dart';
import 'package:optilife/core/navigation/routes.dart' as route;
import '../../core/widgets/button_widget.dart';

class SignupScreen extends ConsumerWidget {
   SignupScreen({super.key});
  
    final GlobalKey<FormState>_formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 38),
                ),
                SizedBox(
                  height: deviceHeight * 0.05,
                ),
                TextBoxWidget(
                  controller: emailController,
                  hint: 'Email',
                ),
                SizedBox(height: deviceHeight * 0.02),
                TextBoxWidget(
                  
                  controller: passwordController,
                  hint: 'Password',
                ),
                SizedBox(
                  height: deviceHeight * 0.1,
                ),
                ButtonWidget(
                    text: 'Sign Up',
                    backgroundColor: Colors.white60,
                    onPressed: () {
                      Navigator.of(context).pushNamed(route.userInfo);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
