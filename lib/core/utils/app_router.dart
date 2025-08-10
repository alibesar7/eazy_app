import 'package:esay_app/Features/Subscriptions/Presentation/views/Subscriptions_view.dart';
import 'package:esay_app/Features/Subscriptions/Presentation/views/Upgrade_view.dart';
import 'package:esay_app/Features/Subscriptions/Presentation/views/payment_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const UpgradeView();
      }),
  GoRoute(
      path: '/subscriptions',
      builder: (BuildContext context, GoRouterState state) {
        return const SubscriptionsView();
      }),
      GoRoute(
      path: '/payment',
      builder: (BuildContext context, GoRouterState state) {
        return const PaymentView();
      })
]);
