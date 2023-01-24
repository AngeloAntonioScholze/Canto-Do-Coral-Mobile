import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:canto_coral/widgets/outLinkButton.dart';

class NewsPage extends StatelessWidget {
  final String title;
  final String mainText;
  final String image;
  final String url;
  static final String onde = 'A NOTÍCIA';

  NewsPage({
    this.image,
    this.title,
    this.mainText,
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    final appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(title),
          )
        : AppBar(
            title: Text(title),
          );

    final pageBody = SafeArea(
      child: ListView(
        children: [
          Card(
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                image.isEmpty
                    ? Container()
                    : Container(
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
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(
                    MediaQuery.of(context).size.height * 0.025,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Text(
                        mainText,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      OutLinkButton(onde, url),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
          );
  }
}
