import 'package:flutter/material.dart';
import 'package:widgets_app/features/widgets/presentation/widgets/shared/main_appbar.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = "ui_controls_screen";
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _UiControlsView();
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView({
    super.key,
  });

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, boat, plane, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool _developerMode = false;
  Transportation _transportation = Transportation.car;
  bool _breakFast = false;
  bool _lunch = false;
  bool _dinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Ui Controls Screen"),
      body: ListView(
        children: [
          SwitchListTile(
              title: const Text("Developer Mode"),
              subtitle: const Text("Additional controls "),
              value: _developerMode,
              onChanged: (value) {
                setState(() {
                  _developerMode = !_developerMode;
                });
              }),
          ExpansionTile(
            expansionAnimationStyle: AnimationStyle(curve: Curves.bounceIn),
            textColor: Theme.of(context).colorScheme.primary,
            title: const Text("Transports Vehicle"),
            subtitle: Text("${_transportation.name}"),
            children: [
              RadioListTile(
                  title: const Text("By Car"),
                  subtitle: const Text("Travel by car"),
                  groupValue: _transportation,
                  value: Transportation.car,
                  onChanged: (value) {
                    setState(() {
                      _transportation = Transportation.car;
                    });
                  }),
              RadioListTile(
                  title: const Text("By Boat"),
                  groupValue: _transportation,
                  subtitle: const Text("Travel by boat"),
                  value: Transportation.boat,
                  onChanged: (value) {
                    setState(() {
                      _transportation = Transportation.boat;
                    });
                  }),
              RadioListTile(
                  title: const Text("By Plane"),
                  groupValue: _transportation,
                  subtitle: const Text("Travel by plane"),
                  value: Transportation.plane,
                  onChanged: (value) {
                    setState(() {
                      _transportation = Transportation.plane;
                    });
                  }),
              RadioListTile(
                  title: const Text("By Submarine"),
                  groupValue: _transportation,
                  subtitle: const Text("Travel by Submarine"),
                  value: Transportation.submarine,
                  onChanged: (value) {
                    setState(() {
                      _transportation = Transportation.submarine;
                    });
                  })
            ],
          ),
          CheckboxListTile(
              title: const Text("Breakfast?"),
              value: _breakFast,
              onChanged: (value) {
                setState(() {
                  _breakFast = !_breakFast;
                });
              }),
          CheckboxListTile(
              title: const Text("Lunch?"),
              value: _lunch,
              onChanged: (value) {
                setState(() {
                  _lunch = !_lunch;
                });
              }),
          CheckboxListTile(
              title: const Text("Dinner?"),
              value: _dinner,
              onChanged: (value) {
                setState(() {
                  _dinner = !_dinner;
                });
              })
        ],
      ),
    );
  }
}
