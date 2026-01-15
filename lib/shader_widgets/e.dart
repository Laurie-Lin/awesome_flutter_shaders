import 'package:awesome_flutter_shaders/main.dart';
import 'package:awesome_flutter_shaders/shaders.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shader_graph/shader_graph.dart';

List<Widget> buildShaderWidgets() {
  return [
    AwesomeShader(SA.ed209),
    AwesomeShader('shaders/e/electron.frag', upSideDown: false),
    // Elemental Ring
    AwesomeShader('shaders/e/Elemental Ring.frag'),
    // TODO: Fix: Effect not match
    // Builder(
    //   builder: (context) {
    //     final main = 'shaders/e/Elevated.frag'.shaderBuffer;
    //     final bufferA = 'shaders/e/Elevated BufferA.frag'.shaderBuffer;
    //     bufferA.feed(
    //       SA.textureGreyNoiseMedium,
    //       wrap: .repeat,
    //       filter: .linear,
    //     );
    //     main.feedShader(bufferA);
    //     return AwesomeShader(
    //       [bufferA, main],
    //     );
    //   },
    // ),
    // Endless living creature
    AwesomeShader('shaders/e/Endless living creature.frag'),
    AwesomeShader(
      SA.entryLevel
          .feed(
            SA.textureAbstract1,
            wrap: .repeat,
          )
          .feed(SA.cubemapUffiziGallery),
    ),
    // Ether
    AwesomeShader('shaders/e/Ether.frag'),
    AwesomeShader('shaders/e/Eve Arrives.frag'.feed(SA.textureOrganic2)),
    // Even faster procedural ocean
    if (!kIsWeb) AwesomeShader('shaders/e/Even faster procedural ocean.frag'),
  ];
}
