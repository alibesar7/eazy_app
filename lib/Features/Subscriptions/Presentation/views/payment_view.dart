import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/custom_cost_card.dart';
import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/custom_data_card.dart';
import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/custom_appbar.dart';
import 'package:esay_app/core/utils/appStyles.dart';
import 'package:esay_app/core/utils/app_assets.dart';
import 'package:esay_app/core/utils/widgets/custom_alert_dialog.dart';
import 'package:esay_app/core/utils/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sizer/sizer.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

final formKey = GlobalKey<FormBuilderState>();
final cardNumberController = TextEditingController();
final expDateController = TextEditingController();
final cvvCodeController = TextEditingController();
final cardHolderNameController = TextEditingController();
@override
void dispose() {
  cardNumberController.dispose();
  expDateController.dispose();
  cvvCodeController.dispose();
  cardHolderNameController.dispose();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "بوابة الدفع"),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.5.h, bottom: 1.5.h),
                  child: Image.asset(Assets.assetsIconsEazy),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Assets.assetsIconsPadlock3),
                    Padding(
                      padding: const EdgeInsets.only(top: 9),
                      child: Text(
                        "   Secure payment",
                        style: AppTextStyles.textTajawal,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: FormBuilder(
                    key: formKey,
                    child: CustomDataCard(),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text(
                      "تكلفة الاشتراك",
                      style: AppTextStyles.text16,
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(17),
              child: CustomCostWidget(),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 20, right: 10, left: 10, top: 20),
              child: SizedBox(
                height: 60,
                child: Custombtn(
                  widget: Image.asset(
                    Assets.assetsIconsLeft,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    if (formKey.currentState?.saveAndValidate() ?? false) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomAlertDialog.CustomAlertDialog(
                            widget1: Image.asset(Assets.assetsIconsMobilePay),
                            widget2: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff2A72AD),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("تم",
                                  style: AppTextStyles.text14
                                      .copyWith(color: Colors.white)),
                            ),
                          );
                        },
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'الرجاء تعبئة جميع الحقول المطلوبة بشكل صحيح'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
