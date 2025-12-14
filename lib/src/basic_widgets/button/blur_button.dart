// File: blur_button.dart
// Author: ChengWenChi
// Created: 2025/12/13 10:58
// Modified: 2025/12/13 10:58
// Description: 带模糊背景的按钮(有性能消耗，尽量避免在列表中用)

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jige_basickit/src/extensions/string_extensions.dart';

class BlurButton extends StatelessWidget {
  final VoidCallback onTap; //点击回调
  final double blur; // 高斯模糊程度, 越大越模糊
  final double radius; // 按钮圆角
  final Color color; // 按钮背景色
  final double width; // 按钮宽度
  final double height; // 按钮高度
  final String? assetImagePath; // 本地图片路径（null则不显示图片）
  final double? imageWidth; // 图片宽度
  final double? imageHeight; // 图片高度
  final BoxFit imageFit; // 图片适配模式
  final Widget? child; // 支持任意Widget（第三方Image、文字、混合布局等）

  const BlurButton({
    super.key,
    required this.onTap,
    this.blur = 8.0,
    this.radius = 12.0,
    this.color = const Color.fromRGBO(255, 255, 255, 0.3),
    this.width = 80,
    this.height = 40,
    this.assetImagePath,
    this.imageWidth = 30,
    this.imageHeight = 30,
    this.imageFit = BoxFit.contain,
    this.child,
  });

  // 根据assetImagePath返回Image
  Widget? _buildAssetImage() {
    if (assetImagePath.isNotNullAndNotEmpty) {
      return Image.asset(
        assetImagePath!,
        width: imageWidth,
        height: imageHeight,
        fit: imageFit,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 点击事件
      onTap: onTap,
      child: ClipRRect(
        // 圆角
        borderRadius: BorderRadius.circular(radius),
        child: BackdropFilter(
          // 高斯模糊效果
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            width: width,
            height: height,
            // 按钮背景色（半透明）
            color: color,
            alignment: Alignment.center,
            child: child ?? _buildAssetImage(),
          ),
        ),
      ),
    );
  }
}
