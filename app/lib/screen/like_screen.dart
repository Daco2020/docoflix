import 'package:app/model/mock_movies.dart';
import 'package:app/model/model_movie.dart';
import 'package:app/screen/detail_screen.dart';
import 'package:flutter/material.dart';

class LikeScreen extends StatefulWidget {
  _LikeScreenState createState() => _LikeScreenState();
}

class _LikeScreenState extends State {
  Widget _getMovies(BuildContext context) {
    List<Movie> likeResult = [];
    for (var movie in movies) {
      if (movie.like == true) {
        likeResult.add(movie);
      }
    }
    return Expanded(
      child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1 / 1.5,
          padding: EdgeInsets.all(3),
          children:
              likeResult.map((data) => _buildListItem(context, data)).toList()),
    );
  }

  Widget _buildListItem(BuildContext context, Movie data) {
    return InkWell(
      child: Image.network(data.poster),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            fullscreenDialog: true,
            builder: (BuildContext context) {
              return DetailScreen(movie: data);
            }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "images/netflix-logo.png",
                    fit: BoxFit.contain,
                    height: 25,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "내가  찜한 콘텐츠",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            _getMovies(context)
          ],
        ),
      ),
    );
  }
}
