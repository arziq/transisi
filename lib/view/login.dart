import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_soal/view/home.dart';
import 'package:validatorless/validatorless.dart';

import '../controller/login_controller.dart';
import '../resources/strings.dart';
import '../resources/theme.dart';
import '../widget/texfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final LoginController login = Get.put(LoginController());
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              SizedBox(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Image.asset(ImagePath.logo),
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: Form(
                  key: formKey1,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[400],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Center(
                          child: Text(
                            Strings.signInTitle,
                            style: MyTextStyles.h3,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: TextFieldWidget(
                            label: "Email",
                            controller: email,
                            typeKeyboard: TextInputType.emailAddress,
                            validator: Validatorless.multiple([
                              Validatorless.required(
                                  "Inputan tidak boleh kosong"),
                              Validatorless.email("Email tidak valid")
                            ]),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: TextFieldWidget(
                            label: "Password",
                            controller: pass,
                            typeKeyboard: TextInputType.visiblePassword,
                            validator: Validatorless.multiple(
                              [
                                Validatorless.required(
                                    "Inputan tidak boleh kosong")
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: login.isLoading.value
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: MyColors.greyColor),
                                  onPressed: () {},
                                  child: const CircularProgressIndicator(),
                                )
                              : ElevatedButton(
                                  onPressed: () {
                                    if (formKey1.currentState!.validate()) {
                                      login.isLoading.value = true;
                                      login
                                          .loginUser(email.text, pass.text)
                                          .then((value) {
                                        login.isLoading.value = false;
                                        if (value == true) {
                                          return Get.to(() => HomePage());
                                        }
                                      });
                                    }
                                  },
                                  child: const Text(
                                    Strings.signInTitle,
                                    style: MyTextStyles.h6,
                                  ),
                                ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
