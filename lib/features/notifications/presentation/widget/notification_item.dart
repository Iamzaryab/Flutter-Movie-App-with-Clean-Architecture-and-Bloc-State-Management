import 'package:flutter/cupertino.dart';
import 'package:filmku/app/app_colors.dart';
import 'package:filmku/app/app_dimens.dart';
import 'package:filmku/features/notifications/data/models/notification.dart';
import 'package:filmku/shared/extensions/build_context_extensions.dart';

class NotificationItem extends StatefulWidget {
  final NotificationModel notificationModel;
  final Duration delay;

  const NotificationItem(
      {Key? key, required this.notificationModel, required this.delay})
      : super(key: key);

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _sliderAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _sliderAnimation =
        Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 1))
            .animate(CurvedAnimation(
                parent: _animationController, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 2.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
    _animationController.forward();
    // Future.delayed(const Duration(milliseconds: 1000), () {
    //   _animationController.forward();
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Padding(
        padding: EdgeInsets.only(
            top: AppDimens.p4, right: AppDimens.p8, left: AppDimens.p8),
        child: Container(
          padding: EdgeInsets.only(
              top: AppDimens.p12,
              bottom: AppDimens.p12,
              right: AppDimens.p12,
              left: AppDimens.p12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimens.p8),
              color: context.theme.brightness == Brightness.light
                  ? widget.notificationModel.positive
                      ? AppColors.updateNotificationColorLight
                      : AppColors.deleteNotificationColorLight
                  : widget.notificationModel.positive
                      ? AppColors
                          .updateNotificationColorDark // Dark theme - Dark green color for update notifications
                      : AppColors.deleteNotificationColorDark),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Movie: ${widget.notificationModel.title}',
                  style: context.textTheme.titleSmall!
                      .copyWith(color: AppColors.white)),
              Text(
                widget.notificationModel.message,
                style: context.textTheme.bodySmall!
                    .copyWith(color: AppColors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
