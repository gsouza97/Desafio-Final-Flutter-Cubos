import 'package:flutter/material.dart';
import 'package:movies_app/home/widgets/movie_card_widget.dart';
import 'package:movies_app/utils/app_text_styles.dart';

class CategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Last Releases',
              style: AppTextStyles.heading30,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                MovieCardWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
