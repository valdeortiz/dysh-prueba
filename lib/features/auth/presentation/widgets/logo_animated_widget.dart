import 'package:flutter/material.dart';

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({required this.animation, super.key})
      : super(listenable: animation);
  // Maneja los Tween estáticos debido a que estos no cambian.
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 150);

  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    // final Animation<double> animation = animation;
    return Opacity(
      opacity: _opacityTween.evaluate(animation),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: _sizeTween.evaluate(animation), // Aumenta la altura
        width: _sizeTween.evaluate(animation), // Aumenta el ancho

        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/image.png')),
        ),
      ),
    );
  }
}
