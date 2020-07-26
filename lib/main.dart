import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flame/util.dart';
import 'package:tic_tac_no/tic-tac-no.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Util flameUtil = Util();
  //await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);
  final Size size = await flameUtil.initialDimensions();

  final TicTacNo game = TicTacNo(size);
  runApp(game.widget);
}