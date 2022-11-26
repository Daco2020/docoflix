import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Container(
              // 더보기의 프로필 이미지
              padding: EdgeInsets.only(top: 50),
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(
                  "images/netflix-logo.png",
                ),
              ),
            ),
            Container(
              // 더보기의 프로필 이름
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "Daco",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
            Container(
              // 더보기의 프로필 이름 밑줄
              padding: EdgeInsets.all(15),
              width: 70,
              height: 5,
              color: Colors.red,
            ),
            Container(
              // 더보기의 프로필 링크 주소
              padding: EdgeInsets.all(10),
              child: Linkify(
                onOpen: (link) async {
                  if (await canLaunch(link.url)) {
                    await launch(link.url);
                  }
                },
                text: 'https://github.com/Daco2020',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                linkStyle: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              // 더보기의 프로필 수정하기 버튼
              padding: EdgeInsets.all(10),
              child: TextButton(
                onPressed: () {},
                child: Container(
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "프로필 수정하기",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
