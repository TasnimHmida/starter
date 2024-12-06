import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewExample extends StatefulWidget {
  const PageViewExample({super.key});

  @override
  State<PageViewExample> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  late PageController _controller;
  int currentPageViewIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView.builder(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    currentPageViewIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Center(
                    child: Image.asset(pagesContent[index]['image'] ?? ''),
                  );
                },
                itemCount: pagesContent.length,
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r)),
              color: Color(0xffF7F7F7)),
          child: Column(
            children: [
              Text(
                pagesContent[currentPageViewIndex]['mainText'] ?? '',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: pagesContent.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 8.h,
                  dotWidth: 8.w,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

final List<Map<String, String>> pagesContent = [
  {
    "image": "assets/images/sample_onboard_image.png",
    "mainText": "Bienvenue chez chichkhan",
    "secondaryText": "Votre café et repas, livrés en un rien de temps!"
  },
  {
    "image": "assets/images/sample_onboard_image.png",
    "mainText": "une expérience personnalisée",
    "secondaryText":
        "Créez un compte – Profitez de commandes plus rapides et de récompenses"
  },
  {
    "image": "assets/images/sample_onboard_image.png",
    "mainText": "Gardez un œil sur votre commande",
    "secondaryText":
        "Suivez votre commande – De la cuisine jusqu’à votre porte."
  },
];
