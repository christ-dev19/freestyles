import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/AppRouting.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  bool obscureTextPassword = true;

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    double p = 4 * fullWidth / 4.5;
    double dimenssionCircleTop = p + (p / 6.5);

    Color colorPrimary = Colors.indigo.shade900;
    Color colorSecondary = Colors.lightBlueAccent.withOpacity(.1);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
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
                      boxShadow: const [
                        BoxShadow(
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
                            child: SizedBox(
                              height: 35,
                              width: 35,
                              child: Icon(
                                Icons.arrow_back_ios_sharp,
                                color: colorPrimary,
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
                                        fontSize: aspectRatio * 60,
                                        fontWeight: FontWeight.w800,
                                        color: colorPrimary,
                                      ),
                                    ),
                                    Text(
                                      "Account,",
                                      style: TextStyle(
                                        fontSize: aspectRatio * 60,
                                        fontWeight: FontWeight.w800,
                                        color: colorPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "Please sign up to continue,",
                                style: TextStyle(
                                  fontSize: aspectRatio * 40,
                                  fontWeight: FontWeight.w500,
                                  color: colorPrimary,
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    child: Column(
                      children: [
                        Form(
                          child: Column(
                            children: [
                              _buildFieldInput(
                                context,
                                obscureText: false,
                                hintText: "Full name",
                              ),
                              _buildFieldInput(
                                context,
                                obscureText: false,
                                hintText: "Email address",
                              ),
                              _buildFieldInput(
                                context,
                                hintText: "password",
                                obscureText: true,
                                showSuffixIcon: false,
                              ),
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
                                borderRadius: BorderRadius.circular(60),
                              ),
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
                                  color: colorPrimary,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Sign In",
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

  Container _buildFieldInput(
    BuildContext context, {
    TextEditingController? fullNameController,
    bool obscureText = false,
    bool showSuffixIcon = false,
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
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            hintStyle: const TextStyle(color: Colors.black26),
          ),
          obscureText: obscureText),
    );
  }
}

class InnerShadowDecoration extends Decoration {
  final ShapeBorder shape;
  final double depth;
  final List<Color> colors;
  final double opacity;

  const InnerShadowDecoration({
    required this.shape,
    required this.depth,
    this.colors = const [Colors.black87, Colors.white],
    this.opacity = 1.0,
  }) : assert(colors.length == 2);

  @override
  EdgeInsetsGeometry get padding => shape.dimensions;

  @override
  BoxPainter createBoxPainter([ui.VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _ConcaveDecorationPainter(
        shape, depth, colors, opacity);
  }
}

class _ConcaveDecorationPainter extends BoxPainter {
  ShapeBorder shape;
  double depth;
  List<Color> colors;
  double opacity;

  _ConcaveDecorationPainter(this.shape, this.depth, this.colors, this.opacity) {
    if (depth <= 0) {
      depth = -depth;
    }
    colors = [
      colors[0].withOpacity(opacity),
      colors[1].withOpacity(opacity),
    ];
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final shapePath = shape.getOuterPath(offset & configuration.size!);
    final rect = shapePath.getBounds();

    final delta = 16 / rect.longestSide;
    final stops = [0.5 - delta, 0.5 + delta];

    final path = Path()
      ..fillType = PathFillType.evenOdd
      ..addRect(rect.inflate(depth * 2))
      ..addPath(shapePath, Offset.zero);
    canvas.save();
    canvas.clipPath(shapePath);

    final paint = Paint()
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, depth);
    final clipSize = rect.size.aspectRatio > 1
        ? Size(rect.width, rect.height / 2)
        : Size(rect.width / 2, rect.height);
    for (final alignment in [Alignment.topLeft, Alignment.bottomRight]) {
      final shaderRect =
          alignment.inscribe(Size.square(rect.longestSide), rect);
      paint
        .shader = ui.Gradient.linear(
            shaderRect.topLeft, shaderRect.bottomRight, colors, stops);

      canvas.save();
      canvas.clipRect(alignment.inscribe(clipSize, rect));
      canvas.drawPath(path, paint);
      canvas.restore();
    }
    canvas.restore();
  }
}
