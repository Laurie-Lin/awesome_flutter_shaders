import 'package:awesome_flutter_shaders/main.dart';
import 'package:awesome_flutter_shaders/shaders.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shader_graph/shader_graph.dart';

List<Widget> buildShaderWidgets() {
  return [
    if (!kIsWeb) AwesomeShader(SA.fire3D),
    AwesomeShader(SA.flame),
    AwesomeShader(SA.fractalPyramid),
    if (!kIsWeb)
      AwesomeShader(() {
        final bufferA = SA.fracturedOrbBufferA.shaderBuffer;
        bufferA.feed(
          SA.textureRgbaNoiseMedium,
          wrap: WrapMode.repeat,
          filter: FilterMode.linear,
        );
        final bufferB = SA.fracturedOrb.feed(bufferA);
        return [bufferA, bufferB];
      }),
    if (!kIsWeb) AwesomeShader(SA.fullSpectrumCyber),
  ];
}
