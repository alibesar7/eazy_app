
import 'package:flutter/material.dart';

import '../../../../utils/appAssets.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      child: Stack(children: [
        Image.asset(
          AppAssets.assetsIconsOval,
          height: 115,
          width: 115,
          fit: BoxFit.cover,
        ),
        Positioned(
            right: 5,
            bottom: 5,
            child: InkWell(
              onTap: () {
              },
              child: Container(
                  height: 25,
                  width: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      color: Colors.white),
                  child: Image.asset(AppAssets.assetsIconsCamera)),
            ))
      ]),
    );
  }
}
