import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CustomPinPutWidget extends StatelessWidget {
  const CustomPinPutWidget({
    super.key,
    required this.pinController,
    required this.focusNode,
    required this.defaultPinTheme,
    required this.focusedPinTheme,
    required this.submittedPinTheme,
  });

  final TextEditingController pinController;
  final FocusNode focusNode;
  final PinTheme defaultPinTheme;
  final PinTheme focusedPinTheme;
  final PinTheme submittedPinTheme;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 4,
      controller: pinController,
      focusNode: focusNode,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      onCompleted: (pin) {
        debugPrint('onCompleted: $pin');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('الرمز المكتمل: $pin')),
        );
      },
      onChanged: (value) {
        debugPrint('onChanged: $value');
      },
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 9),
            width: 22,
            height: 1,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}