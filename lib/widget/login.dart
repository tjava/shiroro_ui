import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pop_alert/pop_alert.dart';
import 'package:shiroro_ui/constants/colors.dart';
import 'package:shiroro_ui/controllers/login_controller.dart';
import 'package:shiroro_ui/widget/custom_text.dart';
import 'package:shiroro_ui/widget/pop_up.dart';
import 'package:shiroro_ui/widget/register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  LoginController loginController = Get.find();

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
            SizedBox(
              height: 100,
              width: 100,
              child: Lottie.asset(
                'assets/animations/login.json',
                controller: controller,
                onLoaded: (composition) {
                  controller.repeat();
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 20),
              child: CustomText(
                text: 'Login',
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
                    Icons.alternate_email,
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
                  labelText: 'Email',
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
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                loginController.login(
                  email: emailController.text,
                  password: passwordController.text,
                );

                PopAlert.loadingAlert(context: context);
                Future.delayed(const Duration(milliseconds: 2000), () {
                  if (loginController.status.value == 200) {
                    Navigator.pop(context);
                    PopAlert.iconAlert(
                      context: context,
                      title: 'Login Successful',
                      icon: PopAlertIcon.success,
                      color: Colors.green,
                    );
                  } else {
                    Navigator.pop(context);
                    PopAlert.iconAlert(
                      context: context,
                      title: 'Authentication Failed',
                      texts: loginController.errors,
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
                    text: 'Login',
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
                  text: 'Does not have account?',
                  size: 15,
                ),
                TextButton(
                  child: CustomText(
                    text: 'Register',
                    color: green,
                    size: 15,
                    weight: FontWeight.bold,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) => const PopUp(
                        form: Register(),
                        isLogin: false,
                      ),
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
