import 'package:filmku/features/notifications/presentation/bloc/notification_bloc.dart';
import 'package:filmku/features/notifications/presentation/screen/notification_sheet_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationSheet extends StatelessWidget {
  const NotificationSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          NotificationBloc()..add(const GetAllNotificationsEvent()),
      child: const NotificationSheetView(),
    );
  }
}
