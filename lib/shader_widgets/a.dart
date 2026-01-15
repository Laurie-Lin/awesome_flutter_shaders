import 'package:awesome_flutter_shaders/main.dart';
import 'package:awesome_flutter_shaders/shaders.dart';
import 'package:flutter/material.dart';
import 'package:shader_graph/shader_graph.dart';

List<Widget> buildShaderWidgets() {
  return [
    AwesomeShader(SA.aLotOfSpheres),
    AwesomeShader(SA.aStudyOfGlass),
    AwesomeShader(() {
      final mainBuffer = SA.alienOcean.shaderBuffer;
      final bufferA = SA.alienOceanBufferA.shaderBuffer;
      mainBuffer.feed(bufferA).feed(SA.textureRgbaNoiseSmall);
      return [bufferA, mainBuffer];
    }),
    AwesomeShader(SA.alienSpaceJockey),
    AwesomeShader(
      SA.alphaClip1BitDissolve.feed(
        SA.textureGreyNoiseSmall,
        wrap: .repeat,
        filter: .linear,
      ),
      upSideDown: false,
      inputs: [SA.textureLondon],
    ),
    AwesomeShader('shaders/a/Analytic Motionblur 2D.frag'),
    AwesomeShader(
      'shaders/a/anamorphic rendering.frag',
      upSideDown: false,
      inputs: [SA.textureLondon],
    ),
    AwesomeShader(SA.angel),
    AwesomeShader(SA.arcadePacman),
    AwesomeShader(SA.artifactAtSea),
    AwesomeShader(SA.atmosphereSystemTest),
  ];
}
