import 'package:flutter/material.dart';

import '../pages/video_page.dart';

class VideoItem extends StatelessWidget {
  final String title;
  final String mainText;
  final String image;
  final String externalLink;

  VideoItem({
    this.title,
    this.mainText,
    this.image,
    this.externalLink,
  });

  void _navigateTo(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return VideoPage(
            title: title,
            mainText: mainText,
            image: image,
            externalLink: externalLink,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          MediaQuery.of(context).size.height * 0.02,
        ),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      child: InkWell(
        onTap: () => _navigateTo(context),
        child: Column(
          children: [
            image.isEmpty
                ? Container()
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(
                              MediaQuery.of(context).size.height * 0.02,
                            ),
                            topLeft: Radius.circular(
                              MediaQuery.of(context).size.height * 0.02,
                            ),
                          ),
                          child: Image.network(
                            image,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.height * 0.15,
                      ),
                    ],
                  ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.15,
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.025,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
