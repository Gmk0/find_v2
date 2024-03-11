import 'package:find_v2/components/CustomTextFormField.dart';
import 'package:find_v2/components/raisedeButton.dart';
import 'package:find_v2/controller/authController.dart';
import 'package:find_v2/utils/authValidators.dart';
import 'package:find_v2/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  AuthController authController = Get.put(AuthController());

  final _formKey = GlobalKey<FormState>();
  bool termsAccepted = false;
  TextEditingController termsController = TextEditingController(text: '');

  var isLogin = false.obs;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
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
          Center(
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Prevents excessive stretching
                children: [
                  // App logo or title (optional)

                  const SizedBox(height: 15),
                  const Text(
                    'Bienvenu sur Find freelance',
                    style: TextStyle(
                      fontSize: 20,
                      //fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  register(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget register() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                controller: authController.nameController,
                hintText: "Nom d'utilisateur",
                prefixIcon: Icons.email_outlined,
                type: TextInputType.name,
                validator: (value) {
                  //return AuthValidators.emailValidator(value!);
                },
              ),
              const SizedBox(
                height: 15,
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
                height: 15,
              ),
              CustomTextFormField(
                controller: authController.telephone,
                hintText: 'Telephone',
                prefixIcon: Icons.phone_outlined,
                type: TextInputType.emailAddress,
                validator: (value) {
                  //return AuthValidators.emailValidator(value!);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                controller: authController.passwordController,
                hintText: 'Mot de passe',
                prefixIcon: Icons.lock_clock_outlined,
                type: TextInputType.visiblePassword,
                validator: (value) {
                  return AuthValidators.passwordValidator(value!);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                controller: authController.passwordConfirmation,
                hintText: 'Confirmation',
                prefixIcon: Icons.lock_clock_outlined,
                type: TextInputType.visiblePassword,
                validator: (value) {
                  return AuthValidators.passwordValidator(value!);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                controller: authController.parainage,
                hintText: 'Parainage',
                prefixIcon: Icons.lock_clock_outlined,
                type: TextInputType.visiblePassword,
                validator: (value) {
                  // return AuthValidators.passwordValidator(value!);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CheckboxListTile(
                checkColor: Colors.white,
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side:
                      const BorderSide(color: Colors.white), // Bordure blanche
                  borderRadius: BorderRadius.circular(
                      8), // Rayon de 8 pour arrondir les coins
                ),
                title: Text(
                  'J\'accepte les conditions générales',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade800,
                  ),
                ),
                value: termsAccepted,
                onChanged: (bool? newValue) {
                  setState(() {
                    termsAccepted = newValue ?? false;
                    authController.terms.text = termsAccepted.toString();
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              const SizedBox(
                height: 15,
              ),
              RaisedeButton(
                onBtnPressed: () async {
                  bool? isValid = _formKey.currentState?.validate();
                  if (isValid!) {
                    setState(() {
                      isLoading = true;
                    });

                    authController.register();
                    isLoading = false;
                  }
                  //authController.login();
                },
                btntext: isLoading ? "Inscription..." : 'Inscription',
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Get.to(const Login(), transition: Transition.fadeIn);
                },
                child: Text("Vous avez deja un compte? connectez-vous",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.grey.shade800)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
