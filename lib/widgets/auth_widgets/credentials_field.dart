import 'package:flutter/material.dart';

class CredentialsForm extends StatefulWidget {
  const CredentialsForm(
      {super.key,
        required this.isPassword,
        this.controller,
        required this.labelText});

  final bool isPassword;
  final TextEditingController? controller;
  final String? labelText;

  @override
  State<CredentialsForm> createState() => _TextFormState();
}

class _TextFormState extends State<CredentialsForm> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      keyboardType: widget.isPassword?TextInputType.text:TextInputType.emailAddress,
      obscureText: widget.isPassword?isObscure:false,
      controller: widget.controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: const BorderSide(
              width: 0.5
          ),
              borderRadius: BorderRadius.circular(10)
          ),
          labelText: widget.labelText,
          suffixIcon: widget.isPassword?
          GestureDetector(
              onTap: (){
                setState(() {
                  isObscure = !isObscure;
                });
              },
              child: isObscure?const Icon(Icons.visibility):const Icon(Icons.visibility_off)
          )
              :const Text("")
      ),
    );
  }
}
