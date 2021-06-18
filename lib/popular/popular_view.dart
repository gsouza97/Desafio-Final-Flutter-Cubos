import 'package:flutter/material.dart';
import 'package:movies_app/popular/popular_controller.dart';
import 'package:movies_app/widgets/category_widgets.dart';
import 'package:movies_app/utils/app_text_styles.dart';

class PopularView extends StatefulWidget {
  @override
  _PopularViewState createState() => _PopularViewState();
}

class _PopularViewState extends State<PopularView> {
  final controller = PopularController();

  @override
  void initState() {
    super.initState();
    controller.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: StreamBuilder(
        stream: controller.movieStream.stream,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            );
          } else if (snapshot.hasData) {
            return Center(
              child: CategoryWidget(
                movies: snapshot.data.movies,
                category: 'Populares',
              ),
            );
          } else if (snapshot.hasError) {
            return AlertDialog(
              title: Text(
                snapshot.error.toString(),
                style: AppTextStyles.body,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      controller.getPopularMovies();
                    });
                  },
                  child: Text('Tentar Novamente'),
                )
              ],
            );
          }
          return Container();
        }),
      ),
    );
  }
}
