import 'package:awesome_flutter_shaders/main.dart';
import 'package:awesome_flutter_shaders/shaders.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

List<Widget> buildShaderWidgets() {
  return [
    AwesomeShader(SA.octagrams),
    if (!kIsWeb) AwesomeShader(SA.origami),
  ];
}
