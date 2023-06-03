import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:freestyles/core/AppRouting.dart';

//// Loign page
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                                  color: _colorPrimary,
                                ),
                              ),
                              Text(
                                "Back,",
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
                          "Let's get started",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: _colorPrimary,
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
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
                                    color: _colorPrimary),
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
                                color: _colorPrimary,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Sign up",
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
        decoration: InnerShadowDecoration(
        depth: 10,
        colors: [Colors.white54, Colors.black12],
        opacity: .4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
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


class InnerShadowDecoration extends Decoration {
  final ShapeBorder shape;
  final double depth;
  final List<Color> colors;
  final double opacity;

  InnerShadowDecoration({
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
        this.shape, this.depth, this.colors, this.opacity);
  }
}

class _ConcaveDecorationPainter extends BoxPainter {
  ShapeBorder shape;
  double depth;
  List<Color> colors;
  double opacity;

  _ConcaveDecorationPainter(this.shape, this.depth, this.colors, this.opacity) {
    if (depth > 0) {
      colors = [
        colors[1],
        colors[0],
      ];
    } else {
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
        ..shader = ui.Gradient.linear(
            shaderRect.topLeft, shaderRect.bottomRight, colors, stops);

      canvas.save();
      canvas.clipRect(alignment.inscribe(clipSize, rect));
      canvas.drawPath(path, paint);
      canvas.restore();
    }
    canvas.restore();
  }
}
