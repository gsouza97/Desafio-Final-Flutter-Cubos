import 'package:flutter/material.dart';
import 'package:movies_app/top_rated/top_rated_controller.dart';
import 'package:movies_app/widgets/category_widgets.dart';
import 'package:movies_app/utils/app_text_styles.dart';
import 'package:movies_app/widgets/movie_card_widget.dart';

class TopRatedView extends StatefulWidget {
  @override
  _TopRatedViewState createState() => _TopRatedViewState();
}

class _TopRatedViewState extends State<TopRatedView> {
  final controller = TopRatedController();

  @override
  void initState() {
    super.initState();
    controller.getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: StreamBuilder(
        stream: controller.topRatedStream.stream,
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
                        'Mais Votados',
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
                      controller.getTopRatedMovies();
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
