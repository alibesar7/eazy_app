
import 'package:flutter/material.dart';

import '../../utils/appColors.dart';
import '../../utils/appStyles.dart';


class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onButtonClick;
  final String text;

  const CustomElevatedButton({
    Key? key,
    required this.onButtonClick,
    required this.text, required TextStyle textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),),
      onPressed: onButtonClick,
      child: Text(text,style:  AppTextStyles.caption,),
    );
  }
}