import 'dart:math';
import 'package:flutter/material.dart';
import 'package:widgets_app/features/widgets/presentation/widgets/shared/main_appbar.dart';

class AnimatedScreen extends StatelessWidget {
  static const String name = "animated_container_screen";
  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AnimatedContainerView();
  }
}

class _AnimatedContainerView extends StatefulWidget {
  const _AnimatedContainerView({
    super.key,
  });

  @override
  State<_AnimatedContainerView> createState() => _AnimatedContainerViewState();
}

class _AnimatedContainerViewState extends State<_AnimatedContainerView> {
  final Random _random = Random();
  double width = 200;
  double height = 200;
  double borderRadius = 12;
  Color color = Colors.red;

  void _changeContainerShape() {
    int next(int min, int max) => min + _random.nextInt(max - min);

    width = next(100, 350).toDouble();
    height = next(100, 400).toDouble();
    borderRadius = next(0, 100).toDouble();
    color = Color.fromRGBO(next(0, 255), next(0, 255), next(0, 255), 1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Animated Containers"),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _changeContainerShape,
        label: const Text("Change"),
      ),
      body: Center(
        child: AnimatedContainer(
          curve: Curves.easeInToLinear,
          duration: const Duration(milliseconds: 300),
          width: width <= 0 ? 0 : width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        ),
      ),
    );
  }
}
