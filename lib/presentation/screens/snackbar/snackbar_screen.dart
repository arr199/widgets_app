import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/widgets/shared/main_appbar.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = "snackbar_screen";
  const SnackbarScreen({super.key});

  void showCustomSnackbar(
    BuildContext context, {
    String message = "This is a Snackbar",
  }) {
    final snackBar = ScaffoldMessenger.of(context);
    snackBar.clearSnackBars();
    snackBar.showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: "Ok",
        onPressed: () {},
      ),
    ));
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("Custom Dialog"),
          content: Text("Do you accept our evil terms?"),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Cancel")),
            FilledButton(
                onPressed: () {
                  showCustomSnackbar(context,
                      message: "You have accepted the terms");
                  context.pop();
                },
                child: Text("Accept")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Snackbars and Dialogs"),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showCustomSnackbar(context);
        },
        icon: const Icon(Icons.terminal),
        label: const Text("Show Snackbar"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () => showAboutDialog(context: context),
                child: const Text("Show licenses")),
            FilledButton(
                onPressed: () => showCustomDialog(context),
                child: const Text("Show dialog"))
          ],
        ),
      ),
    );
  }
}
