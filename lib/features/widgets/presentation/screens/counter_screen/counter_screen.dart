import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/features/widgets/presentation/providers/counter/counter_provider.dart';
import 'package:widgets_app/features/widgets/presentation/providers/counter/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = "counter_screen";
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final counter = ref.watch(counterProvider);
    final isDarkMode = ref.watch(darkModeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Screen"),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(darkModeProvider.notifier).update((s) => !s);
            },
            icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          "Value: $counter",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
