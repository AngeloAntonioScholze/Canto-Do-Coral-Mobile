import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:canto_coral/widgets/outLinkButton.dart';

class VideoPage extends StatelessWidget {
  final String title;
  final String mainText;
  final String image;
  final String externalLink;
  static final String onde = 'O VÍDEO';

  VideoPage({
    this.title,
    this.mainText,
    this.image,
    this.externalLink,
  });

  //funçao asincrona para abrir links externos
  _openBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: false,
      );
    } else {
      throw 'Não foi possivel abrir o site $url';
    }
  }

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
              vertical: MediaQuery.of(context).size.width * 0.01,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                image.isEmpty
                    ? Container()
                    : Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
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
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => _openBrowser(externalLink),
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.height * 0.15,
                            ),
                          ),
                        ],
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
                        height: MediaQuery.of(context).size.height * 0.035,
                      ),
                      Text(
                        mainText,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      OutLinkButton(onde, externalLink),
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
