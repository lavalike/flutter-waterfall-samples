import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../entity/movie_data.dart';
import '../focus/focus_container.dart';
import '../remote/data-repository.dart';

/// recommend_movies
/// Created by wangzhen on 2023/6/25
class RecommendMovies extends StatefulWidget {
  const RecommendMovies({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RecommendMoviesState();
}

class RecommendMoviesState extends State<RecommendMovies> {
  @override
  Widget build(BuildContext context) {
    List movies = DataRepository.provideMovies(8);
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 8,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 1 / 1.5,
      ),
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        return _recommendMovieItem(movies[index]);
      },
    ).build(context);
  }

  _recommendMovieItem(MovieData data) => FocusContainer(
        onTap: () {
          Fluttertoast.showToast(msg: data.title);
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                data.asset,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                padding: const EdgeInsets.all(5),
                child: Center(
                  child: Text(
                    data.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
