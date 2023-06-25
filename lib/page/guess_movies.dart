import 'package:flutter/material.dart';
import 'package:flutter_waterfall_samples/entity/movie_data.dart';
import 'package:flutter_waterfall_samples/focus/focus_container.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '/remote/data-repository.dart';
import 'tag_item.dart';
import 'video_details.dart';

/// guess_movies
/// Created by wangzhen on 2023/6/25
class GuessMovies extends StatefulWidget {
  const GuessMovies({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GuessMoviesState();
}

class _GuessMoviesState extends State<GuessMovies> {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          _movieTag(),
          const SizedBox(height: 10),
          _movies(),
        ],
      );

  _movieTag() {
    List tags = DataRepository.provideMoviesTags();
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 1 / 0.3,
      ),
      itemCount: tags.length,
      itemBuilder: (context, index) {
        return TagItem(tag: tags[index]);
      },
    ).build(context);
  }

  _movies() {
    List list = DataRepository.provideGuessMovies();
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 1 / 1.3,
      ),
      children: [
        _refresh(),
        _movieItem(list[0]),
        _movieItem(list[1]),
        _movieItem(list[2]),
        _movieItem(list[3]),
        _movieItem(list[4]),
      ],
    );
  }

  _refresh() => FocusContainer(
        onTap: () {
          Fluttertoast.showToast(msg: "换一换");
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.refresh,
                color: Colors.orange,
                size: 35,
              ),
              SizedBox(height: 10),
              Text(
                "换一换",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      );

  _movieItem(MovieData data) => FocusContainer(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const VideoDetails()));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              data.asset,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
}
