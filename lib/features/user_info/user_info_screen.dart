import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optilife/core/navigation/routes.dart';
import 'package:optilife/core/widgets/button_widget.dart';
import 'package:optilife/core/widgets/textbox_widget.dart';

class UserInfoScreen extends ConsumerWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userName = TextEditingController();
    final userSurname = TextEditingController();
    final userDOB = TextEditingController();

    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Let\'s get to know you',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.05,
                ),
                TextBoxWidget(
                  controller: userName,
                  hint: 'Insert your name',
                ),
                SizedBox(
                  height: deviceHeight * 0.05,
                ),
                TextBoxWidget(
                  controller: userSurname,
                  hint: 'Insert your surname',
                ),
                SizedBox(
                  height: deviceHeight * 0.05,
                ),
                TextBoxWidget(
                  controller: userDOB,
                  hint: 'Date of Birth',
                ),
                SizedBox(
                  height: deviceHeight * 0.1,
                ),
                ButtonWidget(
                  text: 'Next Step',
                  onPressed: () {
                    Navigator.of(context).pushNamed(home);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
