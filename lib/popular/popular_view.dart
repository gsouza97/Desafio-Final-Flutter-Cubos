import 'package:flutter/material.dart';
import 'package:movies_app/popular/popular_controller.dart';
import 'package:movies_app/widgets/category_widgets.dart';
import 'package:movies_app/utils/app_text_styles.dart';
import 'package:movies_app/widgets/movie_card_widget.dart';

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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: StreamBuilder(
        stream: controller.popularStream.stream,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            );
          } else if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Populares',
                        style: AppTextStyles.heading30,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: size.height * 0.67,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (_, index) {
                            if (index == snapshot.data.length - 2) {
                              controller.loadMore();
                            }
                            return MovieCardWidget(
                              movie: snapshot.data[index],
                            );
                          }),
                    ),
                  ],
                ),
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
