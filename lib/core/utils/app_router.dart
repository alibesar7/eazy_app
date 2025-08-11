import 'package:esay_app/Features/PersonalData/Presentation/views/forget_password.dart';
import 'package:esay_app/Features/PersonalData/Presentation/views/otp_view.dart';
import 'package:esay_app/Features/PersonalData/Presentation/views/reset_password_view.dart';
import 'package:esay_app/Features/PersonalData/Presentation/views/update_password_view.dart';
import 'package:esay_app/Features/Subscriptions/Presentation/views/Subscriptions_view.dart';
import 'package:esay_app/Features/Subscriptions/Presentation/views/Upgrade_view.dart';
import 'package:esay_app/Features/Subscriptions/Presentation/views/payment_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/upgrade',
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
      }),
  GoRoute(
      path: '/resetPassword',
      builder: (BuildContext context, GoRouterState state) {
        return ResetPasswordView();
      }),
  GoRoute(
      path: '/forgetPassword',
      builder: (BuildContext context, GoRouterState state) {
        return ForgetPassword();
      }),
  GoRoute(
      path: '/updatePassword',
      builder: (BuildContext context, GoRouterState state) {
        return UpdatePasswordView();
      }),
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return OTPView();
      }),
]);
