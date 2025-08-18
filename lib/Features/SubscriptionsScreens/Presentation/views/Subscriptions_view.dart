

import 'package:esay_app/Features/SubscriptionsScreens/Presentation/views/widgets/custom_appbar.dart';
import 'package:esay_app/Features/SubscriptionsScreens/Presentation/views/widgets/subscriptions_view_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubscriptionsView extends StatelessWidget {
  const SubscriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "الاشتراكات"),
      body: SubcriptionsViewBody(),
    );
  }
}
