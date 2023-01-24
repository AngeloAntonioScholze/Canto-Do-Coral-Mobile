import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OutLinkButton extends StatelessWidget {
  final String onde;
  final String url;

  OutLinkButton(
    this.onde,
    this.url,
  );

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
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.5,
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.15,
      ),
      decoration: BoxDecoration(
        color: Colors.green[800],
        border: Border.all(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(
          MediaQuery.of(context).size.height * 0.02,
        ),
      ),
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () => _openBrowser(url),
        child: Text(
          'ABRIR $onde',
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
