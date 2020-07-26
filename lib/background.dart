import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/resizable.dart';

class Background extends Component with Resizable {
  static final Paint paint = Paint()..color = Color(0xff006600);

  @override
  void render(Canvas canvas) {
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);
  }

  @override
  void update(double t) {}
}