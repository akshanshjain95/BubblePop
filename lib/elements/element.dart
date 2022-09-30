abstract class Element {
  int elementsInRow;
  int elementsInColumn;

  bool isTapped;

  String pathToElementImage;

  String pathToElementTapSound;

  Function destroyElementOrchestratorCallback;

  Element({required this.elementsInRow, required this.elementsInColumn, required this.pathToElementImage, required this.pathToElementTapSound, required this.destroyElementOrchestratorCallback, this.isTapped = false});

  void destroyElement();
}