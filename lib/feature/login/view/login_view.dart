import 'package:burak_imdat_login/core/constants/color_constants.dart';
import 'package:burak_imdat_login/core/constants/string_constants.dart';
import 'package:burak_imdat_login/product/textfield/login_textfield.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  StringConstants strings = StringConstants.instance;
  ColorConstants colors = ColorConstants.instance;
  bool isObsecure = false;
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: _emailNode.hasFocus || _passwordNode.hasFocus ? const ScrollPhysics() : const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: context.paddingNormal,
          child: SizedBox(
            height: context.dynamicHeight(0.9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Spacer(flex: 3),
                _welcomeBackText(context),
                _designRelishText(context),
                const Spacer(),
                LoginTextField(
                  labelText: strings.emailAddress,
                  focusNode: _emailNode,
                ),
                context.emptySizedHeightBoxLow,
                context.emptySizedHeightBoxLow,
                LoginTextField(
                  focusNode: _passwordNode,
                  labelText: strings.password,
                  isPassword: true,
                  onPressed: () {
                    isObsecure = !isObsecure;
                    setState(() {});
                  },
                ),
                context.emptySizedHeightBoxLow,
                _forgotPasswordTextRow(),
                context.emptySizedHeightBoxNormal,
                _loginButtonSizedBox(context),
                const Spacer(flex: 3),
                _dontYouHaveAnAccountRow(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _welcomeBackText(BuildContext context) {
    return Text(
      strings.welcomeBack,
      style: context.textTheme.headline4?.copyWith(
        color: colors.subTitleColor,
      ),
    );
  }

  Text _designRelishText(BuildContext context) {
    return Text(
      strings.designRelish,
      style: context.textTheme.headline3?.copyWith(
        fontWeight: FontWeight.bold,
        color: colors.titleColor,
      ),
    );
  }

  Row _dontYouHaveAnAccountRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_dontHaveAnAccountText(context), context.emptySizedWidthBoxLow, _createText(context)],
    );
  }

  Text _dontHaveAnAccountText(BuildContext context) {
    return Text(
      strings.dontHaveAnAccount,
      style: context.textTheme.bodyText1?.copyWith(
        color: colors.subTitleColor,
      ),
    );
  }

  Text _createText(BuildContext context) {
    return Text(
      strings.create,
      style: context.textTheme.bodyText1?.copyWith(
        color: colors.black,
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Row _forgotPasswordTextRow() {
    return Row(
      children: [const Spacer(), Text(strings.forgotPassword)],
    );
  }

  SizedBox _loginButtonSizedBox(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height / 12,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          strings.login,
          style: context.textTheme.headline5?.copyWith(
            color: colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: colors.buttonBackgroundColor,
        ),
      ),
    );
  }
}
