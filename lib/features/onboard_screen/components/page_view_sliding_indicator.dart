import 'package:flutter/material.dart';

class PageViewSlidingIndicatorComponent extends StatelessWidget {
  final Color color;
  final double size;
  final double spacing;
  final PageController controller;
  final int pageCount;

  const PageViewSlidingIndicatorComponent({
    Key? key,
    required this.color,
    required this.size,
    required this.spacing,
    required this.controller,
    required this.pageCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: pageCount,
        itemBuilder: (context, index) {
          bool isCurrentPage = index == controller.page?.round();
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: spacing / 2),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.symmetric(horizontal: isCurrentPage ? size * 7 : 0), // Adjust padding for the current page
              decoration: BoxDecoration(
                color: isCurrentPage ? color : color.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
              width: size,
              height: size,
            ),
          );
        },
      ),
    );
  }
}
