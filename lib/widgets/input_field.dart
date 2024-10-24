import 'package:flutter/material.dart';
import 'package:login/utils/pallete.dart';

class InputField extends StatefulWidget {
  final bool isPassword;
  final IconData icon; // Use IconData to specify Flutter icons
  final bool isAppearPassWord;
  final String hintText;
  final TextEditingController textEditingController;

  const InputField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    required this.icon, // IconData for Flutter icons
    this.isAppearPassWord = false,
    this.isPassword = false,
  });

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late bool _isAppearPassWord;

  @override
  void initState() {
    super.initState();
    _isAppearPassWord = widget.isAppearPassWord;
  }

  @override
  Widget build(BuildContext context) {
    return widget.isPassword
        ? TextFormField(
            controller: widget.textEditingController,
            obscureText: !_isAppearPassWord,
            decoration: InputDecoration(
              prefixIcon: Icon(widget.icon, size: 30,), // Using Flutter Icons directly
              contentPadding: const EdgeInsets.all(27),
              enabledBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(color: Pallete.gradient1, width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(color: Pallete.borderColor, width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: widget.hintText,
              suffixIcon: IconButton(
                icon: Icon(_isAppearPassWord
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isAppearPassWord = !_isAppearPassWord;
                  });
                },
              ),
            ),
          )
        : TextFormField(
          controller: widget.textEditingController,
          decoration: InputDecoration(
            prefixIcon: Icon(widget.icon, size: 30,), // Using Flutter Icons directly
            contentPadding: const EdgeInsets.all(27),
            enabledBorder: OutlineInputBorder(
              borderSide:
              const BorderSide(color: Pallete.gradient1, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
              const BorderSide(color: Pallete.borderColor, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: widget.hintText,
          ),
        );
  }
}
