import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:canto_coral/widgets/outLinkButton.dart';

class AuditionsPage extends StatelessWidget {
  final String onde = 'INFORMAÇÕES';

  @override
  Widget build(BuildContext context) {
    final appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('Cante Conosco'),
          )
        : AppBar(
            title: Text('Cante Conosco'),
          );
    final pageBody = SafeArea(
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.height * 0.02,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(
            MediaQuery.of(context).size.height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Audiçoes',
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, Lorem ipsum dolor sit amet, consectetur adipiscing elit, Lorem ipsum dolor sit amet, consectetur adipiscing elit, consectetur adipiscing elit, Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              OutLinkButton(
                onde,
                'https://sites.google.com/view/coralutfpr/cante-conosco',
              )
            ],
          ),
        ),
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
