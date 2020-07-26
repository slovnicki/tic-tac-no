import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';

class Square extends Component {
  final Rect rect;
  Color color;

  Square(this.rect, this.color);

  @override
  void render(Canvas canvas) {
    canvas.drawRect(this.rect, Paint()
      ..color = Color(0xff000000)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
    );

    canvas.drawRect(this.rect, Paint()
      ..color = this.color
      ..style = PaintingStyle.fill
    );
  }

  @override
  void update(double t) {

  }

  Rect toRect() {
    return this.rect;
  }

  void handleTouch(Rect touch) {
    if (this.color == Color(0x66ff0000)) {
      this.color = Color(0x660000ff);
    } else {
      this.color = Color(0x66ff0000);
    }
  }
}