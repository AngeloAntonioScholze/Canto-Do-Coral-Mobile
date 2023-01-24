import 'package:flutter/material.dart';

import '../pages/learn_page.dart';

class LearnItem extends StatelessWidget {
  final String title;
  final String mainText;
  final String externalLink;

  LearnItem(
    this.title,
    this.mainText,
    this.externalLink,
  );

  void _navigateTo(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return LearnPage(
            title: title,
            mainText: mainText,
            externalLink: externalLink,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraint) {
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
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.17,
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        MediaQuery.of(context).size.height * 0.02,
                      ),
                      bottomLeft: Radius.circular(
                        MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                    child: Image.asset(
                      './assets/images/Coral-Ilustração.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.025,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.width * 0.06,
                  ),
                  height: MediaQuery.of(context).size.height * 0.17,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        mainText,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
