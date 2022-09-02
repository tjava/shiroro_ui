import 'package:flutter/material.dart';

class PopUp extends StatefulWidget {
  final Widget form;
  final bool isLogin;
  const PopUp({Key? key, required this.form, this.isLogin = true})
      : super(key: key);

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    scaleAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.bounceOut,
    );

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLogin) {
      return Center(
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            height: 350,
            width: 350,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: widget.form,
          ),
        ),
      );
    }
    return Center(
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Container(
          height: 420,
          width: 350,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          child: widget.form,
        ),
      ),
    );
  }
}
