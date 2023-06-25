import 'package:flutter/material.dart';
import 'package:flutter_waterfall_samples/entity/movie_data.dart';
import 'package:flutter_waterfall_samples/page/video_details.dart';
import '../focus/focus_container.dart';
import '/remote/data-repository.dart';

/// hot_movies
/// Created by wangzhen on 2023/6/25
class HotMovies extends StatefulWidget {
  final int rows;

  const HotMovies({Key? key, this.rows = 1}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HotMoviesState();
}

class _HotMoviesState extends State<HotMovies> {
  @override
  Widget build(BuildContext context) {
    List movies = DataRepository.provideHots(widget.rows);
    return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 1 / 0.6,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) => _buildItem(movies[index]))
        .build(context);
  }

  _buildItem(MovieData data) => FocusContainer(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const VideoDetails()));
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  data.asset,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                padding: const EdgeInsets.all(10),
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
          ],
        ),
      );
}
