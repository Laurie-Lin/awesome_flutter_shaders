import 'package:awesome_flutter_shaders/main.dart';
import 'package:awesome_flutter_shaders/shaders.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shader_graph/shader_graph.dart';

List<Widget> buildShaderWidgets() {
  return [
    if (!kIsWeb) AwesomeShader(SA.darkTransit),
    if (!kIsWeb) AwesomeShader(SA.desireCrystal),
    AwesomeShader(SA.devilGlass),
    AwesomeShader(SA.diveToCloud),
    // TODO: Effect not match
    AwesomeShader(
      SA.digitalBrain.feed(SA.textureRgbaNoiseSmall, wrap: WrapMode.repeat, filter: FilterMode.linear),
    ),
    // ! It is quite laggy but works fine, so comment it out for now
    // AwesomeShader('shaders/d/divergence-free flow curly noise.frag'),
    if (!kIsWeb)
      AwesomeShader(() {
        final bufferA = SA.dodecahedronBufferA.shaderBuffer.feedback();
        final bufferB = SA.dodecahedron.feed(bufferA);
        return [bufferA, bufferB];
      }),
    if (!kIsWeb) AwesomeShader(SA.drifting),
    AwesomeShader(SA.driveHome6RainWindow),
    if (!kIsWeb) AwesomeShader(SA.dullSkullPrometheus.feed(SA.wall)),
    // TODO: Look into the function of this keyboard input
    AwesomeShader(
      SA.dustyNebula4
          .feed(
            SA.textureRgbaNoiseMedium,
            wrap: WrapMode.mirror,
            filter: FilterMode.linear,
          )
          .feedKeyboard(),
    ),
  ];
}
