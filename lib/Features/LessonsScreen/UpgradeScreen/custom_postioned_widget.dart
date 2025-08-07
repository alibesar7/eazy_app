import 'package:flutter/material.dart';

class CustomPostionedWidget extends StatelessWidget {
  const CustomPostionedWidget({
    super.key,
    required this.asset,
    this.right,
    this.top, this.onPressed,
  });
  final String asset;
  final double? right;
  final double? top;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      top: top,
      child: IconButton(icon: (Image.asset(asset)), onPressed: onPressed),
    );
  }
}