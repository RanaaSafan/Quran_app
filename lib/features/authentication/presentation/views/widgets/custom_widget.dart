// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/common.dart';
class CustomTextFormField extends StatelessWidget {
  final String hinttext;
  final bool obsecuretext;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    Key? key,
    required this.hinttext,
    required this.obsecuretext,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecuretext,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(18),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hinttext,
        hintStyle: Common().hinttext,
      ),
    );
  }
}

class CustomPasswordTextFormField extends StatefulWidget {
  final String hinttext;
  bool obsecuretext;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

   CustomPasswordTextFormField({
    Key? key,
    required this.hinttext,
    required this.obsecuretext,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  _CustomPasswordTextFormFieldState createState() => _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState extends State<CustomPasswordTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obsecuretext,
      validator: widget.validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(18),
        hintText: widget.hinttext,
        hintStyle: Common().hinttext,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              widget.obsecuretext = !widget.obsecuretext;
            });
          },
          icon: widget.obsecuretext
              ? const Icon(Icons.visibility_off_rounded)
              : const Icon(Icons.visibility),
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String message;
  final VoidCallback onPressed;
  final Color? color;

  const CustomElevatedButton({
    Key? key,
    required this.message,
    required this.onPressed,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        side: const MaterialStatePropertyAll(BorderSide(color: Colors.grey)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        fixedSize: const MaterialStatePropertyAll(Size.fromWidth(370)),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(vertical: 20),
        ),
        backgroundColor: MaterialStatePropertyAll(color),
      ),
      child: FittedBox(
        child: Text(
          message,
          style: Common().semiboldwhite,
        ),
      ),
    );
  }
}


class DynamicFilledButton extends StatefulWidget {
  const DynamicFilledButton(
      {super.key, required this.child, required this.onPressed, this.color});

  final Widget child;
  // final VoidCallback onPressed;
  final Color? color;
  final FutureOr<void> Function() onPressed;

  @override
  State<DynamicFilledButton> createState() => _DynamicFilledButtonState();
}

class _DynamicFilledButtonState extends State<DynamicFilledButton> {
  bool isLoading = false;

  func() async {
    FocusManager.instance.primaryFocus?.unfocus();

    setState(() {
      isLoading = true;
    });

    await widget.onPressed();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return FractionallySizedBox(
        widthFactor: .8,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CupertinoButton(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            color: widget.color ?? Common().black,
            onPressed: isLoading ? null : func,
            child:
            isLoading ? const CupertinoActivityIndicator() : widget.child,
          ),
        ),
      );
    }
    return FractionallySizedBox(
      widthFactor: .8,
      child: SizedBox(
        height: 48,
        child: FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: widget.color ?? Common().maincolor,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          onPressed: isLoading ? null : func,
          child: isLoading
              ? const SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(),
          )
              : widget.child,
        ),
      ),
    );
  }
}
