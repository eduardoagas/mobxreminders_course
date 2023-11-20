import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobxreminders_course/dialogs/delete_reminder_dialog.dart';
import 'package:mobxreminders_course/state/app_state.dart';
import 'package:provider/provider.dart';

late final _imagePicker = ImagePicker();

class RemindersListView extends StatelessWidget {
  const RemindersListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    return Observer(
      builder: (context) {
        return ListView.builder(
          itemCount: appState.sortedReminders.length,
          itemBuilder: (context, index) {
            return ReminderTile(
              reminderIndex: index,
              imagePicker: _imagePicker,
            );
          },
        );
      },
    );
  }
}

class ReminderTile extends StatelessWidget {
  final int reminderIndex;
  final ImagePicker imagePicker;

  const ReminderTile(
      {Key? key, required this.reminderIndex, required this.imagePicker})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = context.read<AppState>();
    final reminder = appState.sortedReminders[reminderIndex];
    return Observer(
      //the widget to be rebuild if an Observable changes(it automatically know when a rebuild is needed)
      builder: (context) {
        return CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          value: reminder.isDone,
          onChanged: (isDone) {
            context.read<AppState>().modify(
                  reminder,
                  isDone: isDone ?? false,
                );
            reminder.isDone = isDone ?? false;
          },
          title: Row(
            children: [
              Expanded(
                child: Text(
                  reminder.text,
                ),
              ),
              IconButton(
                onPressed: () async {
                  final shouldDeleteReminder =
                      await showDeleteReminderDialog(context);
                  if (shouldDeleteReminder) {
                    if (context.mounted) {
                      context.read<AppState>().delete(reminder);
                    }
                  }
                },
                icon: const Icon(
                  Icons.delete,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
