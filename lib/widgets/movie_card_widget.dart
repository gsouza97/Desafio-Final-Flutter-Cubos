import 'package:flutter/material.dart';
import 'package:movies_app/movie_page.dart';
import 'package:movies_app/utils/app_text_styles.dart';

class MovieCardWidget extends StatelessWidget {
  final String title;
  final String posterUrl;
  final double value;
  final String date;
  final String description;

  const MovieCardWidget({
    @required this.title,
    @required this.posterUrl,
    @required this.value,
    @required this.date,
    @required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MoviePage(
                title: title,
                date: date,
                description: description,
                posterUrl: posterUrl,
              ),
            ),
          );
        },
        child: Hero(
          tag: posterUrl,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://image.tmdb.org/t/p/original$posterUrl',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 300,
                  child: Text(
                    title,
                    style: AppTextStyles.bodyWhite15,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Avaliação: $value',
                  style: AppTextStyles.body,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
