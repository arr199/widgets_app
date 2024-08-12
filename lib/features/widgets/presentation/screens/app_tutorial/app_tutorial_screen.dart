import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class AppTutorialScreen extends StatelessWidget {
  static const String name = "app_tutorial_screen";
  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _AppTutorialView();
  }
}

class _AppTutorialView extends StatefulWidget {
  _AppTutorialView({
    super.key,
  });

  @override
  State<_AppTutorialView> createState() => _AppTutorialViewState();
}

class _AppTutorialViewState extends State<_AppTutorialView> {
  final PageController _pageViewController = PageController();
  int _currentIndex = 0;
  bool _endReached = false;

  @override
  void initState() {
    super.initState();
    _pageViewController.addListener(() {
      if (_pageViewController.page! > 1.5) {
        _endReached = true;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) {
              _currentIndex = value;
              setState(() {});
            },
            controller: _pageViewController,
            children: [
              for (var slide in slidesData)
                _SlideInfo(
                  title: slide.title,
                  caption: slide.caption,
                  imageUlr: slide.imageUlr,
                )
            ],
          ),
          if (_endReached)
            Positioned(
              top: 40,
              right: 20,
              child: FadeInRight(
                duration: const Duration(milliseconds: 700),
                from: 15,
                child: FilledButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text("Skip")),
              ),
            ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < slidesData.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(_currentIndex == i
                        ? Icons.circle_rounded
                        : Icons.circle_outlined),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _SlideInfo extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUlr;

  const _SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUlr,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme(:titleLarge, :bodyMedium) = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        Image.asset(imageUlr),
        const SizedBox(
          height: 20,
        ),
        Text(
          caption,
          style: bodyMedium,
        ),
      ],
    );
  }
}

final slidesData = <_SlideInfo>[
  const _SlideInfo(
    title: "Find your food",
    caption: "Nostrud duis adipisicing qui quis minim qui.",
    imageUlr: "assets/images/1.png",
  ),
  const _SlideInfo(
    title: "Fast delivery",
    caption: "Adipisicing nostrud proident sit enim.",
    imageUlr: "assets/images/2.png",
  ),
  const _SlideInfo(
    title: "Enoy your food",
    caption: "Velit in voluptate commodo eiusmod veniam enim.",
    imageUlr: "assets/images/3.png",
  ),
];
