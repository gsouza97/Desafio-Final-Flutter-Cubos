import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_text_styles.dart';

class MovieWidget extends StatelessWidget {
  final String title;
  final String posterUrl;
  final String date;
  final String description;

  const MovieWidget({
    @required this.title,
    @required this.posterUrl,
    @required this.date,
    @required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 280,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://image.tmdb.org/t/p/original$posterUrl',
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          title,
          style: AppTextStyles.heading,
        ),
        SizedBox(height: 5),
        Text(
          'Data de Estreia: $date',
          style: AppTextStyles.bodyBold,
        ),
        SizedBox(height: 20),
        Text(
          'Enredo',
          style: AppTextStyles.heading,
        ),
        SizedBox(height: 5),
        Text(
          description,
          style: AppTextStyles.body,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
