import 'package:awesome_flutter_shaders/main.dart';
import 'package:awesome_flutter_shaders/shaders.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shader_graph/shader_graph.dart';

List<Widget> buildShaderWidgets() {
  return [
    AwesomeShader(SA.warpedExtrudedSkewedGrid.feed(SA.textureOrganic2)),
    AwesomeShader(SA.warpingProcedural2),
    AwesomeShader(
      SA.wavyfire.feed(SA.textureLondon),
      upSideDown: false,
    ),
    AwesomeShader(SA.water2D.feed(SA.textureLondon)),
    AwesomeShader(
      SA.wavyfire.feed(SA.textureLondon),
      upSideDown: false,
    ),
    if (!kIsWeb) AwesomeShader(SA.whereTheRiverGoes.feed(SA.textureLichen)),
  ];
}
