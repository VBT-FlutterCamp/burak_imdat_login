import 'package:burak_imdat_login/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

// ignore: must_be_immutable
class LoginTextField extends StatefulWidget {
  LoginTextField({Key? key, required this.labelText, this.isPassword = false, VoidCallback? onPressed, required this.focusNode})
      : _onPressed = onPressed ?? (() {}),
        super(key: key);

  final String labelText;
  final bool isPassword;
  final VoidCallback _onPressed;
  final FocusNode focusNode;
  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  ColorConstants colors = ColorConstants.instance;
  late bool isObsecure;
  @override
  void initState() {
    super.initState();
    isObsecure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _textFieldBackgroundContainer(context),
        _textFieldPadding(context),
      ],
    );
  }

  Container _textFieldBackgroundContainer(BuildContext context) {
    return Container(
      width: context.width,
      height: context.dynamicHeight(0.065),
      color: colors.tfBackgroundColor,
    );
  }

  Padding _textFieldPadding(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: widget.focusNode.hasFocus ? 5 : 0),
      child: SizedBox(
        width: context.width - (widget.focusNode.hasFocus ? 5 : 0),
        child: Focus(
          onFocusChange: (value) => setState(() {}),
          child: TextField(
            focusNode: widget.focusNode,
            cursorColor: colors.black,
            cursorWidth: 1.5,
            decoration: _textFieldInputDecoration(context),
            obscureText: isObsecure,
          ),
        ),
      ),
    );
  }

  InputDecoration _textFieldInputDecoration(BuildContext context) {
    return InputDecoration(
      filled: true,
      fillColor: colors.white,
      border: _borderStyle(),
      focusedBorder: _borderStyle(),
      labelText: widget.labelText,
      labelStyle: context.textTheme.headline6?.copyWith(
        color: colors.tfBorderColor,
      ),
      suffixIcon: widget.isPassword ? _textfieldEyeIconButton() : const SizedBox(),
    );
  }

  IconButton _textfieldEyeIconButton() {
    return IconButton(
      icon: _textfieldIcon(),
      onPressed: () {
        isObsecure = !isObsecure;
        setState(() {});
        widget._onPressed;
      },
    );
  }

  Icon _textfieldIcon() {
    return Icon(
      isObsecure ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
      color: colors.tfBorderColor,
      size: context.dynamicWidth(0.08),
    );
  }

  OutlineInputBorder _borderStyle() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: colors.tfBorderColor),
      borderRadius: BorderRadius.zero,
    );
  }
}
