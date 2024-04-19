import 'package:find_v2/animation/fade_in_slide.dart';
import 'package:find_v2/common/loading_overlay.dart';
import 'package:find_v2/common/text_style_ext.dart';
import 'package:find_v2/components/auth_widget.dart';
import 'package:find_v2/controller/authController.dart';
import 'package:find_v2/utils/assets.dart';
import 'package:find_v2/utils/authValidators.dart';
import 'package:find_v2/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import 'package:find_v2/components/TextComponent.dart';
import 'package:icons_plus/icons_plus.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  ValueNotifier<bool> termsCheck = ValueNotifier(false);

  AuthController authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();
  var isLogin = false.obs;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    // final isDark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;

    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const SizedBox(height: 5),
              FadeInSlide(
                duration: .4,
                child: Center(
                    child: Image.asset(
                  appLogo,
                  width: 100.w,
                  height: 50.h,
                )),
              ),
              const SizedBox(height: 15),
              const FadeInSlide(
                duration: .4,
                child: TextComponent(
                  text: "Content de vous revoir ! 👋",
                  size: 15,
                  fw: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const SizedBox(height: 25),
              FadeInSlide(
                  duration: .6,
                  child: CustomTextFormField(
                    controller: authController.emailController,
                    hintText: 'Email',
                    prefixIcon: IconlyLight.message,
                    type: TextInputType.emailAddress,
                  )),
              const SizedBox(height: 20),
              FadeInSlide(
                  duration: .7,
                  child: CustomTextFormField(
                    controller: authController.passwordController,
                    hintText: 'Mot de passe',
                    prefixIcon: IconlyLight.lock,
                    suffixIcon: IconlyLight.hide,
                    obscureT: true,
                    type: TextInputType.visiblePassword,
                    // colorFill: Colors.grey.shade100,
                    validator: (value) {
                      return AuthValidators.passwordValidator(value!);
                    },
                  )),
              const SizedBox(height: 20),
              FadeInSlide(
                duration: .8,
                child: Row(
                  children: [
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Mot de passe oublier?"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              FadeInSlide(
                duration: .9,
                child: Row(
                  children: [
                    const Expanded(
                        child: Divider(
                      thickness: .3,
                    )),
                    Text(
                      "   or   ",
                      style: context.tm,
                    ),
                    const Expanded(
                        child: Divider(
                      thickness: .3,
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              FadeInSlide(
                duration: 1,
                child: LoginButton(
                  icon: Brand(Brands.google, size: 25),
                  text: "Continue with Google",
                  onPressed: () {},
                ),
              ),
              SizedBox(height: height * 0.02),
              SizedBox(height: height * 0.02),
              FadeInSlide(
                duration: 1.2,
                child: LoginButton(
                  icon: Brand(Brands.facebook, size: 25),
                  text: "Continue with Facebook",
                  onPressed: () {},
                ),
              ),
            ]
            // .animate(interval: 10.ms).slide(
            //     begin: const Offset(0, -40),
            //     end: Offset.zero,
            //     // curve: Curves.easeOut,
            //     duration: 1200.ms,
            //     delay: 200.ms),
            ),
      ),
      bottomNavigationBar: FadeInSlide(
        duration: 1,
        direction: FadeSlideDirection.btt,
        child: Container(
          padding:
              const EdgeInsets.only(bottom: 40, left: 20, right: 20, top: 30),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: .2, color: Colors.grey),
            ),
          ),
          child: FilledButton(
            onPressed: () async {
              bool? isValid = _formKey.currentState?.validate();
              if (isValid!) {
                setState(() {
                  isLoading = true;
                });

                LoadingScreen.instance()
                    .show(context: context, text: "Connexion...");
                //await Future.delayed(const Duration(seconds: 1));

                await authController.login();
                LoadingScreen.instance().hide();
                isLoading = false;
              }

              //LoadingScreen.instance().show(context: context, text: "Sign In...");
              //await Future.delayed(const Duration(seconds: 1));

              //LoadingScreen.instance() .show(context: context, text: "Signed In Successfully");
              // await Future.delayed(const Duration(seconds: 1));
              //LoadingScreen.instance().hide();
              //goRouter.goNamed(AppRoutes.home.name);
            },
            style: FilledButton.styleFrom(
              fixedSize: const Size(double.infinity, 50),
              backgroundColor: skinFill,
            ),
            child: const Text(
              "Connexion",
              style:
                  TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
