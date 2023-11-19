import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dialogs/delete_account_dialog.dart';
import '../dialogs/logout_dialog.dart';
import '../state/app_state.dart';

enum MenuAction { logout, deleteAccount }

class MainPopUpMenuButton extends StatefulWidget {
  const MainPopUpMenuButton({super.key});

  @override
  State<MainPopUpMenuButton> createState() => _MainPopUpMenuButtonState();
}

class _MainPopUpMenuButtonState extends State<MainPopUpMenuButton> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuAction>(
      onSelected: (value) async {
        switch (value) {
          case MenuAction.logout:
            final shouldLogOut = await showLogOutDialog(context);
            if (shouldLogOut) {
              if (mounted) {
                context.read<AppState>().logOut();
              }
            }
            break;
          case MenuAction.deleteAccount:
            if (mounted) {
              final shouldDeleteAccount =
                  await showDeleteAccountDialog(context);

              if (shouldDeleteAccount) {
                if (mounted) {
                  context.read<AppState>().deleteAccount();
                }
              }
            }
            break;
        }
      },
      itemBuilder: (context) {
        return [
          const PopupMenuItem<MenuAction>(
            value: MenuAction.logout,
            child: Text('Log out'),
          ),
          const PopupMenuItem<MenuAction>(
            value: MenuAction.deleteAccount,
            child: Text('Delete account'),
          ),
        ];
      },
    );
  }
}
