import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({
    Key key,
    @required this.scrollController,
  }) : super(key: key);
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.all(16),
        controller: scrollController,
        children: [
          Text(
            'Vegetarian cuisine is based on food that meets vegetarian standards by not including meat and animal tissue products. For lacto-ovo vegetarianism, eggs and dairy products are permitted',
            textAlign: TextAlign.center,
          ),
          Container(
            height: 300,
            width: 300,
            child: Image.asset('assets/veg.png'),
          ),
          Text(
              '''1. "Spread love everywhere you go. Let no one ever come to you without leaving happier." -Mother Teresa

2. "When you reach the end of your rope, tie a knot in it and hang on." -Franklin D. Roosevelt

3. "Always remember that you are absolutely unique. Just like everyone else." -Margaret Mead

4. "Don't judge each day by the harvest you reap but by the seeds that you plant." -Robert Louis Stevenson

5. "The future belongs to those who believe in the beauty of their dreams." -Eleanor Roosevelt'''),
        ],
      );
}
