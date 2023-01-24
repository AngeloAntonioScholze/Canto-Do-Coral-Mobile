import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
            child: Center(
              child: CupertinoActivityIndicator(
                animating: true,
                radius: MediaQuery.of(context).size.height * 0.04,
              ),
            ),
          )
        : Container(
            child: Center(
                child: SpinKitWave(
              color: Colors.green[600],
              size: MediaQuery.of(context).size.height * 0.1,
            )),
          );
  }
}
