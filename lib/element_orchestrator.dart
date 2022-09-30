import 'package:flutter/material.dart';
import 'package:hello_flutter/element_request.dart';
import 'package:hello_flutter/elements/element.dart' as application_element;
import 'package:hello_flutter/factory/element_factory.dart';
import 'package:hello_flutter/utils/utilities.dart';

import 'elements/bubble.dart';

class ElementOrchestrator {
  late Function levelEndCallback;
  late List<Widget> elementWidgets;

  late int counter;

  ElementOrchestrator(
      {required this.levelEndCallback,
      required ElementRequest elementRequest}) {
    elementWidgets = initElementWidgets(elementRequest);

    counter = elementRequest.rows * elementRequest.cols;
  }

  List<Widget> initElementWidgets(ElementRequest elementRequest) {
    int rows = elementRequest.rows;
    int cols = elementRequest.cols;

    return Utilities.generateList(rows).map((row) {
      List<ElementWidget> rowChildren = Utilities.generateList(cols).map((col) {
        application_element.Element element =
            ElementFactory.getElement(elementRequest, decrementCounter);
        return ElementWidget(element: element);
      }).toList();

      return Row(children: rowChildren);
    }).toList();
  }

  List<Widget> getElementWidgets() {
    return elementWidgets;
  }

  void decrementCounter() {
    counter--;

    if (counter == 0) {
      levelEndCallback();
    }
  }
}
