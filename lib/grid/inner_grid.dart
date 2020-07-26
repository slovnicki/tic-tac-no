import 'dart:ui';

import 'package:flame/components/component.dart';

import 'package:tic_tac_no/grid/identifier.dart';
import 'package:tic_tac_no/grid/square.dart';

class InnerGrid extends Component {
  final Identifier identifier;
  final Rect rect;
  Paint paint;
  List<List<Square>> _squares = List<List<Square>>();

  int get row => this.identifier.row;
  int get column => this.identifier.column;

  InnerGrid(this.identifier, this.rect) {
    this.paint = Paint()
      ..color = Color(0xff000000)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    for (int i = 0; i < 3; i++) {
      this._squares.add(List<Square>());
      for (int j = 0; j < 3; j++) {
        Square square = Square(
          this,
          Identifier(i+1, j+1),
          Rect.fromLTWH(
            this.rect.left + j * this.rect.width / 3,
            this.rect.top + i * this.rect.width / 3,
            this.rect.width / 3,
            this.rect.width / 3
          ),
          Color(0x66ff0000),
        );
        this._squares[i].add(square);
      }
    }
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(this.rect, paint);

    this._squares.forEach((element) {
      element.forEach((element) {
        element.render(canvas);
      });
    });
  }

  @override
  void update(double t) {

  }

  Rect toRect() {
    return this.rect;
  }

  void handleTouch(Rect touch) {
    this._squares.forEach((element) {
      element.forEach((component) {
        if (component.toRect().overlaps(touch)) {
          component.handleTouch(touch);
        }
      });
    });
  }
}