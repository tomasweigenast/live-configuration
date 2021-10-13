import 'package:flutter/animation.dart';
import 'package:flutter/painting.dart';

class LinearGradientTween extends Tween<LinearGradient> {
  LinearGradientTween({required LinearGradient begin, required LinearGradient end}) : super(begin: begin, end: end);

  @override
  LinearGradient lerp(double t) => LinearGradient.lerp(begin, end, t) ?? super.lerp(t);
}