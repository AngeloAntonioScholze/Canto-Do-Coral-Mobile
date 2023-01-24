import 'package:flutter/material.dart';

import '../pages/news_page.dart';

class NewsItem extends StatelessWidget {
  final String title;
  final String mainText;
  final String image;
  final String url;

  NewsItem(
    this.title,
    this.mainText,
    this.image,
    this.url,
  );
  void _navigateTo(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return NewsPage(
            title: title,
            image: image,
            mainText: mainText,
            url: url,
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
                : Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          MediaQuery.of(context).size.height * 0.02,
                        ),
                        topRight: Radius.circular(
                          MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                      child: Image.network(
                        image,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.15,
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.025,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    mainText,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
