import 'dart:ui';

import 'package:artie/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChildItem extends StatelessWidget {
  final String? asset;
  final String? mask;

  const ChildItem({Key? key, @required this.asset, @required this.mask})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final maxWidth = constraints.maxWidth.isFinite
          ? constraints.maxWidth.toDouble()
          : 200.0;
      final maxHeight = constraints.maxHeight.isFinite
          ? constraints.maxHeight.toDouble()
          : 200.0;

      return FutureBuilder<List>(
        future: _createShaderAndImage(asset!, mask!, maxWidth, maxHeight),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const SizedBox.shrink();
          return ShaderMask(
            blendMode: BlendMode.dstATop,
            shaderCallback: (rect) => snapshot.data![0],
            child: snapshot.data![1],
          );
        },
      );
    });
  }

  Future<List> _createShaderAndImage(
      String asset, String mask, double w, double h) async {
    print("dkhlt2");

    final maskData = await rootBundle.load(mask);
    final targetWidth = w.isFinite ? w.toInt() : null;
    final targetHeight = h.isFinite ? h.toInt() : null;
    final codec = await instantiateImageCodec(
      maskData.buffer.asUint8List(),
      targetWidth: targetWidth,
      targetHeight: targetHeight,
    );
    final fi = await codec.getNextFrame();
    fi;
    final shader = ImageShader(
      fi.image,
      TileMode.clamp,
      TileMode.clamp,
      Matrix4.identity().storage,
    );
    print("assettttttttttttt" + asset);
    final image = Image.network(
      asset,
      fit: BoxFit.cover,
      width: w,
      height: h,
    );
    return [shader, image];
  }
}
