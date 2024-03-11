import 'package:find_v2/components/CustomTextFormField.dart';
import 'package:find_v2/components/raisedeButton.dart';
import 'package:find_v2/controller/authController.dart';
import 'package:find_v2/utils/assets.dart';
import 'package:find_v2/utils/authValidators.dart';
import 'package:find_v2/views/auth/register.dart';
import 'package:find_v2/views/auth/resetPassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthController authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  var isLogin = false.obs;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        // Use Stack to layer background and content
        children: [
          // Background image with slight darkening
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/ff3.png'), // Replace with your asset
                fit: BoxFit.cover, // Ensure image covers the entire screen
                colorFilter: ColorFilter.mode(
                    Colors.black54, BlendMode.multiply), // Darken slightly
              ),
            ),
          ),

          // Centered login form with appropriate padding
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisSize: MainAxisSize.min, // Prevents excessive stretching
                children: [
                  // App logo or title (optional)
                  const SizedBox(height: 100),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      appLogo,
                      height: 120.h,
                      width: 120.w,
                      // Ajoutez d'autres propriétés si nécessaire, telles que la largeur et la hauteur
                    ),
                  ),

                  const SizedBox(height: 20.0),
                  login(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget login() {
    return Container(
        // margin: EdgeInsets.symmetric(horizontal: ),
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  controller: authController.emailController,
                  hintText: 'Email',
                  prefixIcon: Icons.email_outlined,
                  type: TextInputType.emailAddress,
                  validator: (value) {
                    return AuthValidators.emailValidator(value!);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  controller: authController.passwordController,
                  hintText: 'Mot de passe',
                  prefixIcon: Icons.lock_clock_outlined,
                  type: TextInputType.visiblePassword,
                  colorFill: Colors.grey.shade100,
                  validator: (value) {
                    return AuthValidators.passwordValidator(value!);
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(const ResetPassword(),
                            transition: Transition.fadeIn);
                      },
                      child: Text("Mot de passe oublie?",
                          style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              color: Colors.grey.shade700)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                RaisedeButton(
                  onBtnPressed: () async {
                    bool? isValid = _formKey.currentState?.validate();
                    if (isValid!) {
                      setState(() {
                        isLoading = true;
                      });

                      authController.login();
                      isLoading = false;
                    }
                    //authController.login();
                  },
                  btntext: isLoading ? "Connexion..." : 'Connexion',
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Pas de compte ?",
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 12),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Get.to(const Register(), transition: Transition.fadeIn);
                      },
                      child: Text("inscrivez-vous",
                          style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              color: Colors.grey.shade700)),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        backgroundColor: Colors.red,
                      ),
                      icon: const Icon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "Google",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        backgroundColor: Colors.indigo,
                      ),
                      icon: const Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "Facebook",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
