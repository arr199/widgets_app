import 'package:flutter/material.dart';
import 'package:widgets_app/features/widgets/presentation/widgets/shared/main_appbar.dart';

const cardsData = <Map<String, dynamic>>[
  {"elevation": 0.0, "label": "elevation 0"},
  {"elevation": 1.0, "label": "elevation 1"},
  {"elevation": 2.0, "label": "elevation 2"},
  {"elevation": 3.0, "label": "elevation 3"},
  {"elevation": 4.0, "label": "elevation 4"},
  {"elevation": 5.0, "label": "elevation 5"},
];

class CardsScreen extends StatelessWidget {
  static const String name = "cards_screen";
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Cards Screen"),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          for (var index = 0; index < cardsData.length; index++)
            _CardType1(
              elevation: cardsData[index]["elevation"],
              label: cardsData[index]["label"],
            ),
          for (var index = 0; index < cardsData.length; index++)
            _CardType2(
              elevation: cardsData[index]["elevation"],
              label: cardsData[index]["label"],
            ),
          for (var index = 0; index < cardsData.length; index++)
            _CardType3(
              elevation: cardsData[index]["elevation"],
              label: cardsData[index]["label"],
            ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType1({
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 20, 5),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.more_vert))),
            Align(alignment: Alignment.bottomLeft, child: Text(label)),
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType2({
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: color.outline),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 20, 5),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.more_vert))),
            Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "${label[0].toUpperCase()}${label.substring(1).toLowerCase()} - Outline",
                )),
          ],
        ),
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType3({
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    // final color = Theme.of(context).colorScheme;
    return Card(
      elevation: elevation,
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Image.network(
            "https://picsum.photos/id/${elevation.toInt()}/600/250",
            fit: BoxFit.contain,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(10))),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
                alignment: Alignment.topRight,
              ),
            ),
          )
        ],
      ),
    );
  }
}
