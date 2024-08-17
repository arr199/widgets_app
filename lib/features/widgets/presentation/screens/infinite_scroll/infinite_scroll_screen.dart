import 'package:flutter/material.dart';
import 'package:widgets_app/features/widgets/presentation/widgets/shared/main_appbar.dart';

class InfiniteScrollScreen extends StatelessWidget {
  static const String name = "infinite_scroll_screen";
  const InfiniteScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _InfiniteScrollView();
  }
}

class _InfiniteScrollView extends StatefulWidget {
  const _InfiniteScrollView({
    super.key,
  });

  @override
  State<_InfiniteScrollView> createState() => _InfiniteScrollViewState();
}

class _InfiniteScrollViewState extends State<_InfiniteScrollView> {
  List<int> imageIds = List.generate(4, (index) => index + 1);
  final ScrollController _scrollController = ScrollController();
  bool isLoadingImages = false;

  void _addNewImages() async {
    isLoadingImages = true;
    setState(() {});
    final lastId = imageIds.last;
    final newList = List.generate(4, (index) => index + lastId);

    await Future.delayed(const Duration(seconds: 2));
    imageIds.addAll(newList);
    isLoadingImages = false;
    setState(() {});
    _moveScrollToBottom();
  }

  Future<void> _refreshImages() async {
    await Future.delayed(const Duration(seconds: 3));
    imageIds = List.generate(5, (index) => imageIds.last + index);
    setState(() {});
  }

  void _moveScrollToBottom() {
    if (_scrollController.position.pixels + 100 >=
        _scrollController.position.maxScrollExtent) return;
    _scrollController.animateTo(
      _scrollController.position.pixels + 140,
      duration: Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      child: Scaffold(
        appBar: MainAppBar(title: "Infinite Scroll"),
        body: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refreshImages,
                child: ListView.builder(
                    controller: _scrollController,
                    itemCount: imageIds.length,
                    itemBuilder: (context, index) {
                      return FadeInImage(
                        width: double.infinity,
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://picsum.photos/id/${imageIds[index]}/500/300"),
                        placeholder:
                            const AssetImage("assets/images/jar-loading.gif"),
                      );
                    }),
              ),
            ),
            if (isLoadingImages)
              const SizedBox(
                height: 300,
                width: double.infinity,
                child: Center(child: CircularProgressIndicator()),
              )
          ],
        ),
      ),
    );
  }

  // LISTENERS
  void _onLastImage() async {
    if ((_scrollController.position.pixels + 50) >=
        _scrollController.position.maxScrollExtent) {
      _addNewImages();
    }
  }

  @override
  void initState() {
    _scrollController.addListener(_onLastImage);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
