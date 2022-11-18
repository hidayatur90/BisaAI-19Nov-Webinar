import 'package:flutter/material.dart';

class TextFieldJoko extends StatefulWidget {
  final label;
  final initialValue;

  const TextFieldJoko({
    Key? key,
    required this.label,
    this.initialValue,
  }) : super(key: key);

  @override
  State<TextFieldJoko> createState() => _TextFieldJokoState();
}

class _TextFieldJokoState extends State<TextFieldJoko> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(),
      child: TextFormField(
        initialValue: widget.initialValue,
        maxLength: 20,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: const TextStyle(
            color: Colors.blueGrey,
          ),
          suffixIcon: const Icon(
            Icons.email,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey,
            ),
          ),
          helperText: 'Enter your email address',
        ),
        onChanged: (value) {},
      ),
    );
  }
}
