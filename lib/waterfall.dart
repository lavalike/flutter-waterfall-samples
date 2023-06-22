import 'package:flutter/material.dart';
import 'package:flutter_waterfall_samples/data-repository.dart';
import 'package:flutter_waterfall_samples/focus_container.dart';
import 'package:flutter_waterfall_samples/movie_data.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// waterfall
/// Created by wangzhen on 2023/6/22
class WaterfallPage extends StatefulWidget {
  const WaterfallPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WaterfallState();
}

class _WaterfallState extends State<WaterfallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  _buildBody() => Container(
        color: Colors.blue.shade900,
        child: ListView(padding: const EdgeInsets.all(15), children: [
          _buildVideoAndInfo(),
          _buildTitle("Movies One"),
          _buildMovies(),
          _buildTitle("Movies Two"),
          _buildMovies(),
          _buildTitle("Movies Three"),
          _buildMovies(),
          _buildTitle("Movies Four"),
          _buildMovies(),
        ]),
      );

  _buildTitle(String title) => Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ));

  _buildMovies() {
    List movies = DataRepository.provideMovies();
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 1 / 0.6),
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        return _movieItem(movies[index]);
      },
    ).build(context);
  }

  _movieItem(MovieData data) => FocusContainer(
        onTap: () {
          Fluttertoast.showToast(msg: data.title);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            data.asset,
            fit: BoxFit.cover,
          ),
        ),
      );

  _buildVideoAndInfo() {
    return SizedBox(
      height: 350,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: FocusContainer(
                expand: false,
                onTap: () => Fluttertoast.showToast(msg: "video loading"),
                child: Container(
                  color: Colors.black,
                  child: const Center(
                    child: Text(
                      "loading",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                )),
          ),
          const SizedBox(width: 15),
          Expanded(
            flex: 2,
            child: FocusContainer(
                expand: false,
                onTap: () => Fluttertoast.showToast(msg: "video information"),
                child: Container(
                  color: Colors.white10,
                  child: const Center(
                    child: Text(
                      "information",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
