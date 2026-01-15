import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shader_graph/shader_graph.dart';

import 'bricks_game.dart';
import 'shaders.dart';

class PacmanGame extends StatefulWidget {
  const PacmanGame({super.key});

  @override
  State<PacmanGame> createState() => _PacmanGameState();
}

class _PacmanGameState extends State<PacmanGame> {
  KeyboardController keyboardController = KeyboardController();
  late final List<int> _order;

  @override
  void initState() {
    super.initState();
    _order = [0, 1, 2]..shuffle(Random(DateTime.now().microsecondsSinceEpoch));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool needVirtualKeyboard = constraints.maxWidth < 400;
        return Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                double width = constraints.maxWidth;
                double height = constraints.maxHeight;
                return SizedBox(
                  width: width,
                  height: height,
                  child: ShaderSurface.builder(
                    () {
                      final bufferA = '${SA.package}shaders/game/Pacman Game BufferA.frag'.shaderBuffer;
                      final bufferB = '${SA.package}shaders/game/Pacman Game BufferB.frag'.shaderBuffer;
                      final mainBuffer = '${SA.package}shaders/game/Pacman Game.frag'.shaderBuffer;
                      bufferA.fixedOutputSize = const Size(32 * 4.0, 32);
                      bufferA.feedback().feedKeyboard();
                      bufferB.feedShader(bufferA);
                      mainBuffer.feedShader(bufferA).feedShader(bufferB);

                      final buffers = [bufferA, bufferB, mainBuffer];
                      return _order.map((i) => buffers[i]).toList(growable: false);
                    },
                    keyboardController: keyboardController,
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VirtualButtoon(keyboardController: keyboardController),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
