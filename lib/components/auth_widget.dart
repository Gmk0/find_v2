import 'package:find_v2/common/text_style_ext.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  final String text;
  const LoginButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.grey.withOpacity(.1),
        side: BorderSide(
            color: const Color.fromARGB(255, 170, 63, 63), width: .1),
        fixedSize: const Size.fromHeight(50),
        padding: const EdgeInsets.symmetric(horizontal: 15),
      ),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              )),
          Align(alignment: Alignment.centerLeft, child: icon),
        ],
      ),
    );
  }
}

class RichTwoPartsText extends StatelessWidget {
  final String text1;
  final String text2;
  final VoidCallback onTap;
  const RichTwoPartsText({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: context.tm,
        text: text1,
        children: [
          TextSpan(
            text: text2,
            style: context.tm
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
      // cursorColor: isDark ? Colors.grey : Colors.black54,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.withOpacity(.1),
        hintText: "Password",
        prefixIcon: const Icon(IconlyLight.lock, size: 20),
        suffixIcon: const Icon(IconlyLight.hide, size: 20),
        // prefixIconColor: isDark ? Colors.white : Colors.black87,
        // suffixIconColor: isDark ? Colors.white : Colors.black87,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
      // cursorColor: isDark ? Colors.grey : Colors.black54,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.withOpacity(.1),
        hintText: "Email",
        prefixIcon: const Icon(IconlyLight.message, size: 20),
        // prefixIconColor: isDark ? Colors.white : Colors.black87,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputAction? action;
  final TextInputType? type;
  final Color? colorFill;
  final bool? obscureT;

  CustomTextFormField(
      {required this.controller,
      this.hintText,
      this.validator,
      this.prefixIcon,
      this.suffixIcon,
      this.type,
      this.action,
      this.obscureT,
      this.colorFill});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      textInputAction: action,
      keyboardType: type,
      obscureText: obscureT ?? false,
      style:
          TextStyle(fontWeight: FontWeight.w600, color: Colors.grey.shade700),
      decoration: InputDecoration(
        //contentPadding:const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: Colors.grey.shade700)
            : null,
        suffixIcon: suffixIcon != null
            ? Icon(suffixIcon, color: Colors.grey.shade700)
            : null,
        hintText: hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade700,
        ),
        fillColor: Colors.grey.withOpacity(.1),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
