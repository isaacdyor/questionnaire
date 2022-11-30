import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController textEditingController;

  const TextInput({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500.0,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        controller: textEditingController,
        maxLines: null,
      ),
    ); //Column
  }
}
