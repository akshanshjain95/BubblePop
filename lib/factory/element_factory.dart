import 'package:hello_flutter/element_request.dart';
import 'package:hello_flutter/elements/element.dart' as application_element;
import 'package:hello_flutter/enum/element_type.dart';

import '../elements/bubble.dart';

class ElementFactory {
  static application_element.Element getElement(
      ElementRequest elementRequest, Function destroyElementOrchestratorCallback) {
    switch (elementRequest.elementType) {
      case ElementType.bubble:
        return Bubble(
            elementsInRow: elementRequest.rows,
            elementsInColumn: elementRequest.cols,
            destroyElementOrchestratorCallback: destroyElementOrchestratorCallback);
      default:
        return Bubble(
            elementsInRow: elementRequest.rows,
            elementsInColumn: elementRequest.cols,
            destroyElementOrchestratorCallback: destroyElementOrchestratorCallback);
    }
  }
}
