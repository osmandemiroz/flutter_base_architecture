import 'package:flutter/material.dart';

///Project Padding
@immutable
final class ProjectPadding extends EdgeInsets {
  ///Default All Distance Padding 20
  const ProjectPadding._() : super.all(20);

  ///Normal All Distance Padding
  const ProjectPadding.allMedium() : super.all(24);

  ///Large All Distance Padding
  const ProjectPadding.allLarge() : super.all(32);

  ///Small All Distance Padding
  const ProjectPadding.allSmall() : super.all(8);

  ///Symmetric
  ///Only Left,Right,Top,Bottom ext.
}
