import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextBoxWidget extends ConsumerStatefulWidget {
  final TextEditingController controller;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? title;
  final String? hint;
  final bool? isPassword;
  final int? maxLines;
  final String? label;
  final String Function(String? value)? validator;

  const TextBoxWidget(
      {super.key,
      required this.controller,
      this.textInputAction,
      this.textInputType,
      this.title,
      this.hint,
      this.isPassword,
      this.maxLines,
      this.label,
      this.validator});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TextBoxWidgetState();
}

class _TextBoxWidgetState extends ConsumerState<TextBoxWidget> {
  // final FocusNode _focusNode = FocusNode();

  // @override
  // void initState() {
  //   _focusNode.addListener(() {
  //     setState(() {});
  //     super.initState();
  //   });

  //   @override
  //   void dispose() {
  //     _focusNode.removeListener(() {});
  //     _focusNode.dispose();
  //     super.dispose();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      obscureText: widget.isPassword ?? false,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
        fillColor: Colors.blueAccent,
        filled: true,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
