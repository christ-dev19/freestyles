import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vm;

class CirclePainter extends CustomPainter {
  final Color color;
  final double sizeCircle;
  final bool left;

  CirclePainter(
      {required this.color, required this.sizeCircle, this.left = true});

  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height;
    final w = size.width;
    final radius = sizeCircle;
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // left w = 0; w-radius; startAngle=90, endAngle=-180
    // right w=100; w+radius; startAngle= 90, endAngle=180
    double offsetX = left ? -radius : w + radius;
    double sweepAngle = left ? -180 : 180;

    Offset center = Offset(offsetX, h / 2);
    Rect rect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawArc(
      rect,
      vm.radians(90),
      vm.radians(sweepAngle),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
/**/
class DividerPainter extends CustomPainter {
  final Color color;
  final double thickness;
  final double indent;

  DividerPainter({
    this.color = Colors.black38,
    this.thickness = 3,
    this.indent = 10,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height == 0 ? 20 : size.height;
    final w = size.width;
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..style = PaintingStyle.fill;
    List<Offset> offsets = [];
    debugPrint("w ==> $w");

    for (var i = indent; i < w; i += indent) {
      offsets.add(Offset(i.toDouble(), h / 2));
    }
    canvas.drawPoints(
      ui.PointMode.lines,
      offsets,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
/**/
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
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _ConcaveDecorationPainter(shape, depth, colors, opacity);
  }
}

class _ConcaveDecorationPainter extends BoxPainter {
  ShapeBorder shape;
  double depth;
  List<Color> colors;
  double opacity;

  _ConcaveDecorationPainter(this.shape, this.depth, this.colors, this.opacity) {
    if (depth > 0) {
      colors = colors.reversed.toList();
    } else {
      depth = -depth;
    }
    colors = colors.map((c) => c.withOpacity(opacity)).toList();
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
      paint.shader = ui.Gradient.linear(
          shaderRect.topLeft, shaderRect.bottomRight, colors, stops);

      canvas.save();
      canvas.clipRect(alignment.inscribe(clipSize, rect));
      canvas.drawPath(path, paint);
      canvas.restore();
    }
    canvas.restore();
  }
}
/**/
class ProgresPainter extends CustomPainter {
  final Color color;
  final double degreeProgress;

  ProgresPainter({required this.color, required this.degreeProgress});

  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height;
    final w = size.width;
    final radius = w / 2;
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Offset center = Offset(w / 2, h / 2);
    Rect rect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawArc(
        rect, vm.radians(-90), vm.radians(degreeProgress), false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
