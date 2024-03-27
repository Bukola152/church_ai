import 'package:flutter/material.dart';

import '../constant.dart';
import '../size_config.dart';
import 'general_text.dart';
class BuildInputField extends StatefulWidget {
  BuildInputField(
      {super.key, required this.inputController,
        required this.inputHintText,
        required this.header,
        required this.keyboardType,
        this.colorName,
        this.onChanged,
        this.maxLength,
        this.enabled,
        this.suffix,
        this.onTap,
        this.readOnly = false,
        bool? isObscured,
        Function()? onPressed});

  TextEditingController inputController;
  Color? colorName;
  String inputHintText;
  String header;
  TextInputType keyboardType;
  int? maxLength;
  bool? enabled;
  void Function(String)? onChanged;
  void Function()? onTap;
  Widget? suffix;
  final bool readOnly;

  @override
  State<BuildInputField> createState() => _BuildInputFieldState();
}
class _BuildInputFieldState extends State<BuildInputField> {
  bool showHint = false;

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(getProportionateScreenHeight(10)),
        borderSide: BorderSide.none
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CreateGeneralText(
          inputText: widget.header,
          fontSize: 14,
          textAlign: TextAlign.center,
          weight: FontWeight.w500,
          colorName: Palette.textColor3,
        ),
        SizedBox(height: getProportionateScreenHeight(8),),
        TextFormField(
          readOnly: widget.readOnly,
          autofocus: false,
          controller: widget.inputController,
          keyboardType: widget.keyboardType,
          cursorColor: Colors.black,
          maxLength: widget.maxLength,
          enabled: widget.enabled,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 10,
                left:10,bottom: 10),
            counterText: '',
            filled: true,
            fillColor: widget.colorName?? Palette.textForm.withOpacity(0.4),
            suffix: Padding(
              padding:
              EdgeInsets.only(right:
              getProportionateScreenWidth(25.67)),
              child: widget.suffix,
            ),
            border: outlineInputBorder,
            disabledBorder: outlineInputBorder,
            errorBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            // focusedErrorBorder: outlineInputBorder,
            hintText: widget.inputHintText,
            hintStyle: TextStyle(
                fontFamily: FontFamily.latoRegular,
                fontSize: getProportionateScreenWidth(14),
                fontWeight: FontWeight.w400,
                color: Palette.textColor3),
          ),
          validator: (value) =>
          value!.isEmpty ? 'Enter ${widget.header}' : null,
          onChanged: (value) {
            setState(() {
              if (value.isEmpty) {
                showHint = false;
              } else {
                showHint = true;
              }
            });
          },
          onTap: widget.onTap,
        ),
      ],
    );
  }
}
class BuildPasswordInputFieldWithoutValidation
    extends StatefulWidget {
  BuildPasswordInputFieldWithoutValidation(
      {required this.inputController,
        required this.inputHintText,
        required this.header,
        required this.isObscured,
        required this.onPressed,
        this.onChanged,
        this.onTap});

  TextEditingController inputController;
  String inputHintText;
  String header;
  bool isObscured;
  void Function(String)? onChanged;
  void Function()? onTap;
  VoidCallback onPressed;

  @override
  State<BuildPasswordInputFieldWithoutValidation> createState() =>
      _BuildPasswordInputFieldWithoutValidationState();
}

class _BuildPasswordInputFieldWithoutValidationState
    extends State<BuildPasswordInputFieldWithoutValidation> {
  bool showHint = false;

  RegExp passwordvalid =
  RegExp(r'(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{8,})');

  bool validatePassword(String pass) {
    String _password = pass.trim();
    if (passwordvalid.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(getProportionateScreenHeight(8)),
        borderSide: BorderSide.none
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CreateGeneralText(
          inputText: widget.header,
          fontSize: 16,
          textAlign: TextAlign.center,
          weight: FontWeight.w400,
          colorName: Palette.textColor3,
        ),
        SizedBox(height: getProportionateScreenHeight(8),),
        TextFormField(
          controller: widget.inputController,
          obscureText: widget.isObscured ? true : false,
          cursorColor: Colors.black,
          keyboardType: TextInputType.text,
          autocorrect: false,
          decoration: InputDecoration(
            suffix: GestureDetector(
              onTap: widget.onPressed,
              child: Padding(
                padding:
                EdgeInsets.only(right: getProportionateScreenWidth(10)),
                child: Icon(
                  widget.isObscured ? Icons.visibility : Icons.visibility_off,
                  color: Palette.background,
                  size: getProportionateScreenWidth(22),
                ),
              ),
            ),
            enabledBorder: outlineInputBorder,
            border: outlineInputBorder,
            disabledBorder: outlineInputBorder,
            errorBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            focusedErrorBorder: outlineInputBorder,
            hintText: widget.inputHintText,
            contentPadding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
            hintStyle: TextStyle(
                fontFamily: FontFamily.latoRegular,
                fontSize: getProportionateScreenWidth(16),
                fontWeight: FontWeight.w400,
                color: Palette.textColor3),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter a password';
            }
            return null;
          },
          onChanged: (value) {
            setState(() {
              if (value.isEmpty) {
                showHint = false;
              } else {
                showHint = true;
              }
            });
          },
          onTap: widget.onTap,
        ),
        SizedBox(
          height: getProportionateScreenHeight(5),
        ),
      ],
    );
  }
}
class BuildPasswordInputField extends StatefulWidget {
  BuildPasswordInputField(
      {required this.inputController,
        required this.inputHintText,
        required this.header,
        required this.isObscured,
        required this.onPressed,
        this.onFieldSubmitted,
        this.onChanged,
        this.onTap});

  TextEditingController inputController;
  String inputHintText;
  String header;
  bool isObscured;
  String? Function(String?)? validator;

  Function(String)? onFieldSubmitted;
  void Function(String)? onChanged;
  void Function()? onTap;
  VoidCallback onPressed;

  @override
  State<BuildPasswordInputField> createState() =>
      _BuildPasswordInputFieldState();
}

class _BuildPasswordInputFieldState extends State<BuildPasswordInputField> {
  bool showHint = false;
  RegExp passwordvalid = RegExp(r'(?=.*[a-z])');
  RegExp passwordvalid2 = RegExp(r'(?=.*[A-Z])');
  RegExp passwordvalid3 = RegExp(r'(?=.*[0-9])');
  RegExp passwordvalid4 = RegExp(r'(?=.*[^A-Za-z0-9])');
  RegExp passwordvalid5 = RegExp(r'(?=.{8,})');

  bool validatePassword(String pass) {
    String _password = pass.trim();
    if (passwordvalid.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePassword2(String pass) {
    String _password = pass.trim();
    if (passwordvalid2.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePassword3(String pass) {
    String _password = pass.trim();
    if (passwordvalid3.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePassword4(String pass) {
    String _password = pass.trim();
    if (passwordvalid4.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePassword5(String pass) {
    String _password = pass.trim();
    if (passwordvalid5.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(getProportionateScreenHeight(8)),
        borderSide:BorderSide.none
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CreateGeneralText(
          inputText: widget.header,
          fontSize: 16,
          textAlign: TextAlign.center,
          weight: FontWeight.w400,
          colorName: Palette.textColor3,
        ),
        SizedBox(height: getProportionateScreenHeight(8),),
        TextFormField(
          controller: widget.inputController,
          autofocus: false,
          obscureText: widget.isObscured ? true : false,
          cursorColor: Colors.black,
          keyboardType: TextInputType.text,
          autocorrect: false,
          decoration: InputDecoration(

            suffix: GestureDetector(
              onTap: widget.onPressed,
              child: Padding(
                padding:
                EdgeInsets.only(right: getProportionateScreenWidth(10)),
                child: Icon(
                  widget.isObscured ? Icons.visibility : Icons.visibility_off,
                  color: Palette.background,
                  size: getProportionateScreenWidth(22),
                ),
              ),
            ),
            contentPadding: const EdgeInsets.only(left: 10,bottom: 10,top: 10),
            enabledBorder: outlineInputBorder,
            border: outlineInputBorder,
            disabledBorder: outlineInputBorder,
            errorBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            focusedErrorBorder: outlineInputBorder,
            hintText: widget.inputHintText,
            hintStyle: TextStyle(
                fontFamily: FontFamily.latoRegular,
                fontSize: getProportionateScreenWidth(16),
                fontWeight: FontWeight.w400,
                color: Palette.textColor3),
          ),
          onFieldSubmitted: widget.onFieldSubmitted,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter Password';
            } else {
              bool result = validatePassword(value);
              if (result == false) {
                return 'Password should contain small letter';
              } else {
                bool result2 = validatePassword2(value);
                if (result2 == false) {
                  return 'Password should contain capital letter';
                } else {
                  bool result3 = validatePassword3(value);
                  if (result3 == false) {
                    return 'Password should contain number';
                  } else {
                    bool result4 = validatePassword4(value);
                    if (result4 == false) {
                      return 'Password should contain special character';
                    } else if (value.length < 8) {
                      return 'Password should be atleast 8 characters';
                    } else {}
                  }
                }
              }
            }
          },
          onChanged: (value) {
            setState(() {
              if (value.isEmpty) {
                showHint = false;
              } else {
                showHint = true;
              }
            });
          },
          onTap: widget.onTap,
        ),
        SizedBox(
          height: getProportionateScreenHeight(5),
        ),
      ],
    );
  }
}