import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class ButtonWidget extends ConsumerWidget {
  final Function() onPressed;
  final String text;
  final String? icon;
  final Color? backgroundColor;
  final ButtonStyle? decoration;
  bool isLoading;

  ButtonWidget(
      {super.key,
      required this.text,
      required this.onPressed,
      this.isLoading = false,
      this.icon,
      this.decoration,
      this.backgroundColor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        width: double.infinity,
        height: 54,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
              )),
          onPressed: onPressed,
        child: Text(text, style: const TextStyle(fontSize: 18),),
        ));
  }
}
