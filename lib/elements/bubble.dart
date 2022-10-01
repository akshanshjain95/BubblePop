import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_flutter/elements/element.dart' as application_element;
import 'package:hello_flutter/utils/utilities.dart';

class Bubble extends application_element.Element {
  Bubble(
      {required super.elementsInRow,
      required super.elementsInColumn,
      super.pathToElementImage = 'assets/images/t_buuble3.png',
      super.pathToElementTapSound = 'audio/pop_sound.mp3',
      required super.destroyElementOrchestratorCallback});

  @override
  void destroyElement() {
    Utilities.play(pathToElementTapSound);
    HapticFeedback.heavyImpact();

    destroyElementOrchestratorCallback();
  }
}

class ElementWidget extends StatefulWidget {
  final application_element.Element element;

  // const Bubble({required this.bubblesInRow, required this.bubblesInColumn});
  ElementWidget({super.key, required this.element});

  @override
  State<ElementWidget> createState() => ElementWidgetState(element: element);
}

class ElementWidgetState extends State<ElementWidget> {
  application_element.Element element;

  ElementWidgetState({required this.element});

  @override
  Widget build(BuildContext context) {
    if (element.isTapped) {
      element.destroyElement();

      return SizedBox(
          width: MediaQuery.of(context).size.width / element.elementsInColumn,
          height: MediaQuery.of(context).size.height / element.elementsInRow);
    } else {
      return Material(
          color: Colors.white.withOpacity(0.5),
          type: MaterialType.circle,
          child: InkWell(
              onTap: onTap,
              child: Image.asset(
                  element.pathToElementImage, //'assets/images/t_buuble3.png'
                  width: MediaQuery.of(context).size.width /
                      element.elementsInColumn,
                  height: MediaQuery.of(context).size.height /
                      element.elementsInRow)));
    }
  }

  void onTap() {
    // Bubble should be popped only once.
    if (!element.isTapped) {
      setState(() {
        element.isTapped = true;
      });
    }
  }
}
