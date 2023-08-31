import 'package:flutter/material.dart';

extension EmptySpace on num {
  SizedBox get  sbheight => SizedBox(height: toDouble());
  SizedBox get sbwidth => SizedBox(width: toDouble());
} 