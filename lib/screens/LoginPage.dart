import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freestyles/core/AppRouting.dart';

import '../core/shared/CustomPainters.dart';

//// Login page
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool obscureTextPassword = true;

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;
    double p = 4 * fullWidth / 4.5;
    double dimenssionCircleTop = p + (p / 6.5);

    Color colorPrimary = Colors.indigo.shade900;
    Color colorSecondary = Colors.lightBlueAccent.withOpacity(.1);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: fullHeight,
            width: fullWidth,
            color: colorSecondary,
            child: Stack(
              children: [
                Positioned(
                  top: -fullHeight / 11.5,
                  left: -1.1 * fullWidth / 8,
                  height: dimenssionCircleTop,
                  width: dimenssionCircleTop,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 1.6 * fullWidth / 8,
                      vertical: .1 * (fullHeight / 12.5),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(0, 5),
                        ),
                      ],
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(fullWidth),
                        top: Radius.circular(fullWidth),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: fullHeight / 9),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome",
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w800,
                                    color: colorPrimary,
                                  ),
                                ),
                                Text(
                                  "Back,",
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w800,
                                    color: colorPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Let's get started",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: colorPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: dimenssionCircleTop - (dimenssionCircleTop / 10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    child: Column(
                      children: [
                        Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildFieldInput(context,
                                  hintText: "your email here"),
                              buildFieldInput(
                                context,
                                hintText: "your password here",
                                showSuffixIcon: true,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 5, bottom: 35),
                                child: Text(
                                  "Forget Password ?",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: colorPrimary),
                                ),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AppRouting.home);
                          },
                          child: Card(
                            elevation: 10,
                            shape: ShapeBorder.lerp(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60),
                              ),
                              1,
                            ),
                            margin: const EdgeInsets.only(
                              bottom: 25,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.indigo.shade900,
                                  borderRadius: BorderRadius.circular(60)),
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 65,
                              ),
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRouting.register,
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have account ? ",
                                style: TextStyle(
                                  color: colorPrimary,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Sign up",
                                style: TextStyle(
                                  color: colorPrimary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildFieldInput(
    BuildContext context, {
    TextEditingController? fullNameController,
    bool showSuffixIcon = false,
    IconData suffixIcon = Icons.visibility_off,
    required String hintText,
  }) {
    double fullWidth = MediaQuery.of(context).size.width;

    return Container(
      width: 4 * fullWidth / 5,
      height: .7 * fullWidth / 5,
      decoration: InnerShadowDecoration(
        depth: 10,
        colors: const [Colors.white54, Colors.black12],
        opacity: .4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        controller: fullNameController,
        validator: (String? v) {
          return null;
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          hintStyle: const TextStyle(color: Colors.black26),
          suffixIcon: showSuffixIcon
              ? IconButton(
                  icon: Icon(
                    suffixIcon,
                    color: Colors.black26,
                  ),
                  onPressed: () {
                    obscureTextPassword = !obscureTextPassword;
                    setState(() => {});
                  })
              : null,
        ),
        obscureText: obscureTextPassword,
      ),
    );
  }
}
