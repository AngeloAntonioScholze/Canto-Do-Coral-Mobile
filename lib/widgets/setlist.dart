import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Setlist extends StatelessWidget {
  final List setlist;

  Setlist(
    this.setlist,
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
    int number = 0;
    return Column(
      children: setlist.map(
        (msc) {
          number++;
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.height * 0.5,
              ),
            ),
            elevation: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.04,
                  width: MediaQuery.of(context).size.height * 0.04,
                  decoration: BoxDecoration(
                    color: Colors.green[600],
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height * 0.5,
                    ),
                  ),
                  child: Text(
                    number.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  msc['nome'],
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.height * 0.5,
                  ),
                  onTap: () => _openBrowser(msc['partitura_url']),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                ),
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
