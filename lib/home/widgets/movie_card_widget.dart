import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_text_styles.dart';

class MovieCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://assets0.minhaserie.com.br/uploads/editor_pictures/000/050/824/content_pic.jpg',
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Captain Marvel',
              style: AppTextStyles.bodyWhite15,
            ),
            SizedBox(height: 3),
            Text(
              'Rating: 6.7',
              style: AppTextStyles.body,
            )
          ],
        ),
      ),
    );
  }
}
