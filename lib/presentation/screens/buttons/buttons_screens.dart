import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = "button_screen";
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsContainer(),
    );
  }
}

class _ButtonsContainer extends StatelessWidget {
  const _ButtonsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Elevated")),
            const ElevatedButton(
                onPressed: null, child: Text("Elevated disabled")),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.alarm),
              label: const Text("Elevated Icon"),
            ),
            FilledButton(onPressed: () {}, child: const Text("Filled")),
            FilledButton.icon(
              onPressed: () {},
              label: const Text("Filled icon"),
              icon: const Icon(Icons.person),
            ),
            OutlinedButton(onPressed: () {}, child: const Text("Outline")),
            OutlinedButton.icon(
              onPressed: () {},
              label: const Text("Outline icon"),
              icon: const Icon(Icons.terminal),
            ),
            TextButton(onPressed: () {}, child: const Text("Text")),
            TextButton.icon(
              onPressed: () {},
              label: const Text("Text icon"),
              icon: const Icon(Icons.text_fields),
            ),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.account_balance)),
            IconButton.filled(
                onPressed: () {}, icon: const Icon(Icons.account_balance)),
            const _CustomButton()
          ],
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: color.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: const Text(
              "Custom Button",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
