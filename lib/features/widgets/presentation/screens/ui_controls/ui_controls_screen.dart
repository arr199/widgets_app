import 'package:flutter/material.dart';
import 'package:widgets_app/features/widgets/presentation/widgets/shared/main_appbar.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = "ui_controls_screen";
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _UiControlsView();
  }
}

class _UiControlsView extends StatelessWidget {
  const _UiControlsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Ui Controls Screen"),
      
    );
  }
}
