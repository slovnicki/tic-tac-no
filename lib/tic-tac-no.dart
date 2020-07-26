import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';

import 'package:tic_tac_no/background.dart';
import 'package:tic_tac_no/grid/grid.dart';

class TicTacNo extends BaseGame with TapDetector {
  final Grid grid;

  TicTacNo(Size size): grid = Grid(size) {
    this.add(Background());
    this.add(grid);
  }

  @override
  void onTapUp(TapUpDetails details) {
    final touch = Rect.fromCenter(
      center: details.globalPosition,
      width: 0, height: 0
    );
    this.grid.handleTouch(touch);
  }
}