import 'package:flutter/material.dart';

import 'enum/element_type.dart';

class ElementRequest {
  ElementType elementType;

  BuildContext buildContext;

  int rows;
  int cols;

  ElementRequest({required this.elementType, required this.buildContext, required this.rows, required this.cols});
}