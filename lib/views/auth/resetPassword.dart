import 'package:find_v2/components/auth_widget.dart';
import 'package:find_v2/components/raisedeButton.dart';
import 'package:find_v2/controller/authController.dart';
import 'package:find_v2/utils/authValidators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  AuthController authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  var isLogin = false.obs;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  const Text(
                    'Mot de passe oublier',
                    style: TextStyle(
                      fontSize: 20,
                      //fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  resetPassword(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget resetPassword() {
    return Form(
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
              btntext: isLoading ? "Connexion..." : 'Renitiliser',
            ),
            const SizedBox(height: 20),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
