import 'package:awesome_flutter_shaders/main.dart';
import 'package:awesome_flutter_shaders/shaders.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shader_graph/shader_graph.dart';

List<Widget> buildShaderWidgets() {
  return [
    //  It is quite laggy but works fine, the reason is source filter is mipmap
    AwesomeShader(() {
      final mainBuffer = SA.landmassZMorph.shaderBuffer;
      mainBuffer.feed(SA.textureLichen, wrap: .repeat);
      return [mainBuffer];
    }),
    if (!kIsWeb) AwesomeShader(SA.letsSelfReflect),
    AwesomeShader(SA.lightInSmoke),
  ];
}
