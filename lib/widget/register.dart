import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pop_alert/pop_alert.dart';
import 'package:shiroro_ui/constants/colors.dart';
import 'package:shiroro_ui/controllers/register_controller.dart';
import 'package:shiroro_ui/widget/custom_text.dart';
import 'package:shiroro_ui/widget/login.dart';
import 'package:shiroro_ui/widget/pop_up.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  RegisterController registerController = Get.find();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 20),
              child: CustomText(
                text: 'Register',
                color: green,
                size: 30,
                weight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 400,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: green,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: green,
                    ),
                  ),
                  labelText: 'Username',
                  floatingLabelStyle: TextStyle(
                    color: green,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 400,
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    color: green,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: green,
                    ),
                  ),
                  labelText: 'Password',
                  floatingLabelStyle: TextStyle(
                    color: green,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 400,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    color: green,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: green,
                    ),
                  ),
                  labelText: 'Registration Token',
                  floatingLabelStyle: TextStyle(
                    color: green,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                await registerController.register(
                  name: nameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                );

                PopAlert.loadingAlert(context: context);
                Future.delayed(const Duration(milliseconds: 2000), () {
                  if (registerController.status.value == 201) {
                    Navigator.pop(context);
                    PopAlert.iconAlert(
                      context: context,
                      title: 'Registration Successful',
                      icon: PopAlertIcon.success,
                      color: Colors.green,
                    );
                  } else {
                    Navigator.pop(context);
                    PopAlert.iconAlert(
                      context: context,
                      title: 'Validation Error',
                      texts: registerController.errors,
                      icon: PopAlertIcon.failed,
                      color: Colors.red,
                    );
                  }
                });
              },
              child: Container(
                height: 50,
                width: 400,
                decoration: BoxDecoration(
                  color: green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: CustomText(
                    text: 'Register',
                    color: light,
                    size: 25,
                    weight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                const CustomText(
                  text: 'Already have account?',
                  size: 15,
                ),
                TextButton(
                  child: CustomText(
                    text: 'Login',
                    color: green,
                    size: 15,
                    weight: FontWeight.bold,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) => const PopUp(form: Login()),
                    );
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
