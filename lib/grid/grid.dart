import 'dart:ui';

import 'package:flame/components/component.dart';

import 'package:tic_tac_no/grid/inner_grid.dart';

class Grid extends Component {
  final int margin = 10;

  Offset center;
  double width;
  Paint paint;
  List<List<InnerGrid>> _innerGrids = List<List<InnerGrid>>();

  Grid(Size size): super() {
    this.center = Offset(size.width / 2, size.height / 2);
    this.width = size.width - 2*this.margin;
    this.paint = Paint()
      ..color = Color(0xff000000)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    for (int i = 0; i < 3; i++) {
      this._innerGrids.add(List<InnerGrid>());
      for (int j = 0; j < 3; j++) {
        InnerGrid innerGrid = InnerGrid(
          Rect.fromLTWH(
            this.margin + j * this.width / 3,
            size.height / 2 - this.width / 2 + i * this.width / 3,
            this.width / 3,
            this.width / 3
          )
        );
        this._innerGrids[i].add(innerGrid);
      }
    }
  }

  @override
  void update(double t) {

  }

  @override
  void render(Canvas canvas) {
    Rect rect = Rect.fromCenter(
      center: this.center, width: this.width, height: this.width
    );
    canvas.drawRect(rect, paint);

    this._innerGrids.forEach((element) {
      element.forEach((element) {
        element.render(canvas);
      });
    });
  }

  void handleTouch(Rect touch) {
    this._innerGrids.forEach((element) {
      element.forEach((component) {
        if (component.toRect().overlaps(touch)) {
          component.handleTouch(touch);
        }
      });
    });
  }
}