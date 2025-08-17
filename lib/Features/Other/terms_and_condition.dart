import 'package:flutter/material.dart';

import '../homeScreen/HomeScreen.dart';
class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "الشروط والأحكام",
          style: TextStyle(fontFamily: 'Shamel'),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => HomeScreen()));}, icon: Icon(Icons.arrow_forward_ios),
          )],
      ),
      body: Padding(
          padding: EdgeInsets.all(50),
      child: Container(
        width: 360,height: 550,padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
        child:
        Text('يوضع هنا نص الشروط والأحكام والذي عادة ما يتكون من عدة أسطر .يوضع هنا نص الشروط والأحكام والذي عادة ما يتكون من عدة أسطر .يوضع هنا نص الشروط والأحكام والذي عادة ما يتكون من عدة أسطر .يوضع هنا نص الشروط والأحكام والذي عادة ما يتكون من عدة أسطر .يوضع هنا نص الشروط والأحكام والذي عادة ما يتكون من عدة أسطر .يوضع هنا نص الشروط والأحكام والذي عادة ما يتكون من عدة أسطر .يوضع هنا نص الشروط والأحكام والذي عادة ما يتكون من عدة أسطر .يوضع هنا نص الشروط والأحكام والذي عادة ما يتكون من عدة أسطر .يوضع هنا نص الشروط والأحكام والذي عادة ما يتكون من عدة أسطر .يوضع هنا نص الشروط والأحكام والذي عادة ما يتكون من عدة أسطر .يوضع هنا نص الشروط والأحكام والذي عادة ما يتكون من عدة أسطر .يوضع هنا نص الشروط والأحكام والذي عادة ما يتكون من عدة أسطر .يوضع هنا نص الشروط والأحكام والذي عادة ما يتكون من عدة أسطر .يوضع هنا نص الش'
            'روط والأحكام والذي عادة ما يتكون من عدة أسطر',
        style: TextStyle(
            fontFamily: 'Shamel',
            fontSize: 12,
            color: Colors.black,height: 2,
            fontWeight: FontWeight.w400),textAlign: TextAlign.center,
        )
        ),
    ));
  }
}
