import 'package:flutter/material.dart';

class AnimatedTextCarousel extends StatefulWidget {
  const AnimatedTextCarousel({super.key});
  @override
  State<AnimatedTextCarousel> createState() => _AnimatedTextCarouselState();
}

class _AnimatedTextCarouselState extends State<AnimatedTextCarousel> {
  final pageController = PageController();
  int currentPage = 0;
  final List<List<String>> texts = [
    ['Just Do It', '간단하다. 흔들리면 그것은 지방이다.'],
    ['꾸준히 하다 보면 변화가 온다.', '포기하지 말고 끝까지 해라.'],
    ['더 나은 내일을 위해', '오늘 최선을 다하자.'],
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: PageView.builder(
        controller: pageController,
        itemCount: texts.length + 1,
        itemBuilder: (context, index) {
          if (index == texts.length) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: texts[0].map((text) => Text(text)).toList(),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: texts[index].map((text) => Text(text)).toList(),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startAutoScroll();
    });
    super.initState();
  }

  void startAutoScroll() {
    Future.delayed(const Duration(seconds: 5)).then(
      (_) {
        if (pageController.hasClients) {
          ++currentPage;
          pageController
              .animateToPage(currentPage,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut)
              .then(
            (_) {
              if (currentPage == texts.length) {
                pageController.jumpToPage(0);
                currentPage = 0;
              }
              startAutoScroll();
            },
          );
        }
      },
    );
  }
}
