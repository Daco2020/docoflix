import 'package:app/model/model_movie.dart';
import 'package:app/screen/detail_screen.dart';
import 'package:flutter/material.dart';

class BoxSlider extends StatelessWidget {
  final List<Movie>? movies;
  BoxSlider({this.movies});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("지금 뜨는 콘텐츠"),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeBoxImages(context, movies!),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeBoxImages(BuildContext context, List<Movie> movies) {
  List<Widget> results = [];
  for (var i = 0; i < movies.length; i++) {
    results.add(
      InkWell(
        onTap: () {
          // 디테일 스크린으로 이동
          Navigator.of(context).push(
            MaterialPageRoute<Null>(
              builder: (BuildContext context) {
                return DetailScreen(
                  movie: movies![i],
                );
              },
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset("images/" + movies[i].poster),
          ),
        ),
      ),
    );
  }
  return results;
}
