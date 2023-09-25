import 'package:filmku/features/notifications/presentation/bloc/notification_bloc.dart';
import 'package:filmku/features/notifications/presentation/widget/notification_item.dart';
import 'package:filmku/shared/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class NotificationSheetView extends StatelessWidget {
  const NotificationSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
      return NestedScrollView(
        controller: ScrollController(),
        physics: const ScrollPhysics(parent: PageScrollPhysics()),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Notifications',
                      style: context.textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: ListView.builder(
          controller: ModalScrollController.of(context),
          itemCount: state.notifications.length,
          itemBuilder: (context, index) {
            return NotificationItem(
                notificationModel: state.notifications[index],delay: Duration(milliseconds: index*50),);
          },

        ),
      );
    });
  }
}
