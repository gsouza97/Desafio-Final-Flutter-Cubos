import 'package:flutter/material.dart';
import 'package:movies_app/movies/theater/theater_controller.dart';
import 'package:movies_app/utils/app_text_styles.dart';
import 'package:movies_app/widgets/movie_card_widget.dart';

class TheaterView extends StatefulWidget {
  @override
  _TheaterViewState createState() => _TheaterViewState();
}

class _TheaterViewState extends State<TheaterView> {
  final controller = TheaterController();

  @override
  void initState() {
    super.initState();
    controller.getTheaterMovies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: StreamBuilder(
        stream: controller.theaterStream.stream,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            );
          } else if (snapshot.hasData) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Hoje Nos Cinemas',
                      style: AppTextStyles.heading30,
                    ),
                  ),
                  SizedBox(height: 4),
                  Container(
                    height: size.height * 0.25,
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
                      controller.getTheaterMovies();
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
