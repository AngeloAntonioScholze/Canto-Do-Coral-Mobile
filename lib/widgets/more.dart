import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/auditions_page.dart';
import '../pages/about_page.dart';
import '../pages/contact_page.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  bool _notificationsOption = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[400]),
        borderRadius: BorderRadius.circular(
          MediaQuery.of(context).size.height * 0.02,
        ),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () => _navigateToAbout(context),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              alignment: Alignment.centerLeft,
              width: double.infinity,
              child: Text(
                'Sobre o Coral',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ),
          InkWell(
            onTap: () => _navigateToAuditions(context),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              alignment: Alignment.centerLeft,
              child: Text(
                'Cante Conosco',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ),
          InkWell(
            onTap: () => _navigateToContact(context),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              alignment: Alignment.centerLeft,
              width: double.infinity,
              child: Text(
                'Contato',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ),
          SwitchListTile.adaptive(
            contentPadding: EdgeInsets.all(0),
            title: Text(
              'Notificações',
              style: Theme.of(context).textTheme.headline2,
            ),
            value: _notificationsOption,
            onChanged: (bool value) async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.setBool('on_off', value);
              setState(() {
                _notificationsOption = value;
              });
              _notificationCheck(value);
            },
          ),
        ],
      ),
    );
  }

  //funçao para ativar as notificaçoes
  void _fcmSubscribe() {
    FirebaseMessaging.instance.subscribeToTopic('geral');
    print('Notificaçoes ativadas.');
  }

  //funçao para desativar as notificaçoes
  void _fcmUnsubscribe() {
    FirebaseMessaging.instance.unsubscribeFromTopic('geral');
    print('Notificaçoes desativadas.');
  }

  //funçao para checar as preferencias sobre notificaçoes
  void _notificationCheck(bool value) {
    if (!value) {
      _fcmUnsubscribe();
      return;
    }
    _fcmSubscribe();
  }

  void getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool value = pref.getBool('on_off');
    if (value != null) {
      setState(() {
        _notificationsOption = value;
      });
      print(_notificationsOption);
    }
  }
}

//funçoes para navegar para proximas paginas
void _navigateToAbout(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) {
        return AboutPage();
      },
    ),
  );
}

void _navigateToAuditions(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) {
        return AuditionsPage();
      },
    ),
  );
}

void _navigateToContact(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) {
        return ContactPage();
      },
    ),
  );
}
