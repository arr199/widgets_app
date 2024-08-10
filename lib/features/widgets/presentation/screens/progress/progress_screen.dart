import 'package:flutter/material.dart';
import '../../widgets/shared/main_appbar.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = "progress_screen";
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "Progress Indicators Screen",
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
      children: [
        SizedBox(height: 30),
        Text("Circular Progress Indicator"),
        SizedBox(height: 15),
        CircularProgressIndicator(strokeWidth: 3),
        SizedBox(height: 30),
        _ControlledProgressIndicator()
      ],
    ));
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: Column(
        children: [
          const Text("Controlled Progress Indicator"),
          const SizedBox(
            height: 15,
          ),
          StreamBuilder(
            stream: Stream.periodic(
              const Duration(milliseconds: 100),
              (value) {
                return value / 50;
              },
            ).takeWhile((value) => value <= 1),
            builder: (context, snapshot) {
              final value = snapshot.data ?? 0;
              return Row(
                children: [
                  CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    value: value,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.white,
                      value: value,
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
