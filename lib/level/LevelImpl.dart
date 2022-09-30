import 'package:flutter/material.dart';
import 'package:hello_flutter/factory/level_factory.dart';
import 'package:hello_flutter/level/level.dart';
import 'package:hello_flutter/utils/utilities.dart';

import '../element_orchestrator.dart';
import '../element_request.dart';
import '../enum/element_type.dart';
import 'level_widget.dart';

class LevelImpl extends Level {
  LevelImpl({required super.pathToLevelImage, required super.pathToLevelEndSound, required super.nextLevelName, required super.context});

  @override
  void endLevel() {
    Utilities.play(pathToLevelEndSound, isLowLatencyNeeded: false, completionCallback: () {

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LevelState(level: LevelFactory.getLevel(nextLevelName, context))));
    });
  }

  @override
  Widget init() {
    int rows = MediaQuery.of(context).size.height ~/ 100;
    int cols = MediaQuery.of(context).size.width ~/ 80;

    ElementRequest elementRequest = ElementRequest(
        elementType: ElementType.bubble,
        buildContext: context,
        rows: rows,
        cols: cols);

    ElementOrchestrator elementOrchestrator = ElementOrchestrator(
        levelEndCallback: endLevel, elementRequest: elementRequest);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(pathToLevelImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: elementOrchestrator.getElementWidgets(),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
