import 'package:ayarla/constants/constants.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class NotificationBadge extends StatelessWidget {
  final bool showBadge;
  final int notificationNumber;
  final Widget child;

  NotificationBadge({
    this.showBadge,
    this.notificationNumber,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Badge(
      showBadge: showBadge ?? true,
      position: BadgePosition.topEnd(end: 0.0001),
      badgeContent: Text('${notificationNumber ?? 1}',
          style: kSmallTextStyle.copyWith(color: Colors.white, fontSize: 12)),
      child: child ??
          Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
    );
  }
}
