import 'dart:ui';

import 'package:flame/components/component.dart';

import 'package:tic_tac_no/grid/identifier.dart';
import 'package:tic_tac_no/grid/inner_grid.dart';

class Square extends Component {
  final InnerGrid parent;
  final Identifier identifier;
  final Rect rect;
  Color color;

  Square(this.parent, this.identifier, this.rect, this.color);

  int get row => this.identifier.row;
  int get column => this.identifier.column;

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
    print('touch at (${parent.row},${parent.column},${this.row},${this.column})');
    if (this.color == Color(0x66ff0000)) {
      this.color = Color(0x660000ff);
    } else {
      this.color = Color(0x66ff0000);
    }
  }
}