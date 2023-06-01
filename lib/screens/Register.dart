import 'package:flutter/material.dart';

import '../../core/AppRouting.dart';

//// register page
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool obscureTextPassword = true;

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;
    double p = 4 * fullWidth / 4.5;
    double dimenssionCircleTop = p + (p / 6.5);
    List<Color> _colorsInnerShadow = [Colors.white, Colors.black87];

    Color _colorPrimary = Colors.indigo.shade900;
    Color _colorSecondary = Colors.lightBlueAccent.withOpacity(.1);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: fullHeight,
          width: fullWidth,
          color: _colorSecondary,
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
                  decoration: const BoxDecoration(
                    color: Colors.white60,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: Offset(0, 5),
                      ),
                    ],
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(1000),
                      top: Radius.circular(1000),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: fullHeight / 9),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// icon
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRouting.login,
                            );
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            child: Icon(
                              Icons.arrow_back_ios_sharp,
                              color: _colorPrimary,
                              size: 20,
                            ),
                          ),
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 100,
                              child: Column(
                                children: [
                                  Text(
                                    "Create an",
                                    style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.w800,
                                      color: _colorPrimary,
                                    ),
                                  ),
                                  Text(
                                    "Account,",
                                    style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.w800,
                                      color: _colorPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "Please sign up to continue,",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: _colorPrimary,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: dimenssionCircleTop - (dimenssionCircleTop / 10),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Column(
                    children: [
                      Form(
                        child: Column(
                          children: [
                            buildFieldInput(context, hintText: "Full name"),
                            buildFieldInput(context, hintText: "Email address"),
                            buildFieldInput(
                              context,
                              hintText: "password",
                              showSuffixIcon: true,
                            ),
                          ],
                        ),
                      ),
                      Card(
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
                            'Sign up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRouting.login);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have account ? ",
                              style: TextStyle(
                                color: _colorPrimary,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Sign In",
                              style: TextStyle(
                                color: _colorPrimary,
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
    );
  }

  Container buildFieldInput(
    BuildContext context, {
    TextEditingController? fullNameController,
    bool showSuffixIcon = false,
    IconData suffixIcon = Icons.visibility_off,
    required String hintText,
  }) {
    double _fullWidth = MediaQuery.of(context).size.width;

    return Container(
      width: 4 * _fullWidth / 5,
      height: .7 * _fullWidth / 5,
      /* decoration: InnerShadowDecoration(
        depth: 10,
        colors: [Colors.white54, Colors.black12],
        opacity: .4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
       */
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        controller: fullNameController,
        validator: (String? v) {},
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
        obscureText: obscureTextPassword ?? true,
      ),
    );
  }
}
