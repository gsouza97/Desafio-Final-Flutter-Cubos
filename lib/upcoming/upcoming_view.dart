import 'package:flutter/material.dart';
import 'package:movies_app/classes/movie_class.dart';
import 'package:movies_app/upcoming/upcoming_controller.dart';
import 'package:movies_app/widgets/category_widgets.dart';
import 'package:movies_app/widgets/movie_card_widget.dart';
import '../utils/app_text_styles.dart';

class UpComingView extends StatefulWidget {
  @override
  _UpComingViewState createState() => _UpComingViewState();
}

class _UpComingViewState extends State<UpComingView> {
  final controller = UpComingController();

  @override
  void initState() {
    super.initState();
    controller.getUpComingMovies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: StreamBuilder<List<Movie>>(
        stream: controller.movieStream.stream,
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
                        'Lançamentos',
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
                            if (index == snapshot.data.length - 1) {
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
                      controller.getUpComingMovies();
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
