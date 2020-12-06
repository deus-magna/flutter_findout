import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class SocialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: EdgeInsets.all(60),
        child: Column(
          children: [
            SnakeButton(
              child: Text('Hola Mundo'),
            ),
            SizedBox(height: 20),
            SnakeButton(
              child: Text('Hola Mundo'),
              snakeColor: Colors.red,
              borderWidth: 2,
            ),
            SizedBox(height: 20),
            SnakeButton(
              onTap: () => print('Hola Mundo tap'),
              child: Text('Hola Mundo'),
              snakeColor: Colors.green,
              borderColor: Colors.black,
              borderWidth: 6,
              duration: Duration(seconds: 4),
            ),
          ],
        ),
      ),
    );
  }
}

class SnakeButton extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Color snakeColor;
  final Color borderColor;
  final double borderWidth;
  final VoidCallback onTap;

  const SnakeButton(
      {Key key,
      this.child,
      this.duration,
      this.snakeColor = Colors.purple,
      this.borderColor = Colors.white,
      this.borderWidth = 3.0,
      this.onTap})
      : super(key: key);
  @override
  _SnakeButtonState createState() => _SnakeButtonState();
}

class _SnakeButtonState extends State<SnakeButton>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration ??
          Duration(
            milliseconds: 1500,
          ),
    );
    _animationController.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: CustomPaint(
        painter: _SnakePainter(
            animation: _animationController,
            borderColor: widget.borderColor,
            borderWidth: widget.borderWidth,
            snakeColor: widget.snakeColor),
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

class _SnakePainter extends CustomPainter {
  final Animation animation;
  final Color snakeColor;
  final Color borderColor;
  final double borderWidth;

  _SnakePainter(
      {this.snakeColor,
      this.borderColor,
      this.borderWidth,
      @required this.animation})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    // Creamos un rectangulo del tamaño del size del custom painter.
    final rect = Offset.zero & size;

    // Creamos un Shader de SweepGradient y se lo agregamos al rectangulo que acabamos de construir
    final paint = Paint();
    paint.shader = SweepGradient(
      colors: [snakeColor, Colors.transparent],
      stops: [0.7, 1.0],
      startAngle: 0.0,
      endAngle: vector.radians(80),
      transform: GradientRotation(
        vector.radians(360 * animation.value),
      ),
    ).createShader(rect);
    
    final path = Path.combine(
      PathOperation.xor,
      Path()..addRect(rect),
      Path()
        ..addRect(
          rect.deflate(borderWidth),
        ),
    );
    
    // Creamos otros rectangulo para crear el borde del boton, le aplicamos la propiedad stroke, se agrega al canvas.
    canvas.drawRect(
        rect.deflate(borderWidth / 2),
        Paint()
          ..color = borderColor
          ..strokeWidth = borderWidth
          ..style = PaintingStyle.stroke);

    // Agregamos el path al canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_SnakePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_SnakePainter oldDelegate) => false;
}
