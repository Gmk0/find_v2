import 'package:find_v2/animation/fade_in_slide.dart';
import 'package:find_v2/common/app_colors.dart';
import 'package:find_v2/components/TextComponent.dart';
import 'package:find_v2/components/auth_widget.dart';
import 'package:find_v2/utils/assets.dart';
import 'package:find_v2/views/auth/authView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:icons_plus/icons_plus.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final height = size.height;
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            FadeInSlide(
              duration: .4,
              child: Image.asset(
                appLogo,
                width: MediaQuery.of(context).size.width * 0.15,
                height: MediaQuery.of(context).size.width * 0.15,
              ),
            ),
            const Spacer(),
            FadeInSlide(
              duration: .5,
              child: Text(
                "Prêt à commencer ?",
                style: theme.textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: height * 0.015),
            const FadeInSlide(
              duration: .6,
              child: Text(
                "Trouvez les services parfaits.",
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            FadeInSlide(
              duration: .7,
              child: LoginButton(
                icon: Brand(Brands.google, size: 25),
                text: "Continue avec Google",
                onPressed: () {},
              ),
            ),
            SizedBox(height: height * 0.02),
            FadeInSlide(
              duration: .8,
              child: LoginButton(
                icon: Icon(
                  Icons.apple,
                  color: isDark ? Colors.white : Colors.black,
                ),
                text: "Continue avec Apple",
                onPressed: () {},
              ),
            ),
            SizedBox(height: height * 0.02),
            FadeInSlide(
              duration: .9,
              child: LoginButton(
                icon: Brand(Brands.facebook, size: 25),
                text: "Continue avec Facebook",
                onPressed: () {},
              ),
            ),
            SizedBox(height: height * 0.02),
            const Spacer(),
            FadeInSlide(
              duration: 1.1,
              child: FilledButton(
                onPressed: () {
                  Get.to(() => SignInView(), transition: Transition.fadeIn);
                },
                style: FilledButton.styleFrom(
                    fixedSize: const Size.fromHeight(50),
                    backgroundColor: Color.fromARGB(255, 235, 115, 11)),
                child: const Text(
                  "Inscription",
                  style: TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            FadeInSlide(
              duration: 1.2,
              child: FilledButton(
                onPressed: () {
                  Get.to(() => SignInView(), transition: Transition.fadeIn);
                },
                style: FilledButton.styleFrom(
                  fixedSize: const Size.fromHeight(50),
                  backgroundColor: Color.fromARGB(255, 246, 163, 91),
                ),
                child: const Text(
                  "Connexion",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Spacer(),
            FadeInSlide(
              duration: 1.0,
              direction: FadeSlideDirection.btt,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const TextComponent(
                        text: "Privacy Policy",
                        size: 10,
                      )),
                  Text("   -   "),
                  TextButton(
                      onPressed: () {},
                      child: const TextComponent(
                        text: "Terms of Service",
                        size: 10,
                      )),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
          ],
        ),
      ),
    );
  }
}
