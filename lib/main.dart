import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

//importar widgets externos
import 'widgets/news_list.dart';
import 'widgets/videos_list.dart';
import 'widgets/learns_list.dart';
import 'widgets/events_list.dart';
import 'widgets/bot_nav_bar.dart';
import 'widgets/more.dart';
import 'widgets/loading.dart';

//inicio das notificaçoes


//definindo canal para notificaçoes
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);

//iniciando plugins para notificaçoes
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

//notificaçoes em background
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

//inicio do app
Future<void> main() async {
  //seta a orientaçao de tela para ser somente vertical
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  //da certeza de inicializaçao correta de interaçoes do sistema
  WidgetsFlutterBinding.ensureInitialized();

  //inicializaçao parcial do firebase
  await Firebase.initializeApp();

  //controla formato de notificaçoes em background
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }

  //ativando notificaçoes em primeiro plano para IOS
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  //chamando funçao de iniciar o app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          headline2: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          bodyText2: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
      title: 'Canto do Coral',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  //variaveis para inicializar firebase
  bool _initialized = false;
  bool _error = false;

  //variaveis para o conteudo de cada tab
  int _selectedIndex = 0;
  int _titleIndex = 0;
  int _contentIndex = 0;

  @override
  void initState() {
    //chamado da funçao para garantir firebase iniciado
    initFirebase();

    //inicializa as opçoes do android para notificaçoes funcionarem
    var initializationSettingsAndroid =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    //gerando a notificaçao em primeiro plano
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channel.description,
              color: Colors.green[700],
              playSound: true,
              icon: '@mipmap/ic_launcher',
            ),
          ),
        );
      }
    });

    //chamado da funçao para saber se e a primeira vez que alguem abre o app, tambem faz a primeira inscriçao para notificaçoes
    _isFirstTime();

    super.initState();
  }

  //lista de titulos de cada pagina (refactorar em um junto com a lista de widgets em objetos?)
  final _tituloText = const [
    {'titleText': 'Notícias'},
    {'titleText': 'Vídeos'},
    {'titleText': 'Exercícios'},
    {'titleText': 'Eventos'},
    {'titleText': 'Mais'}
  ];

  //lista de widgets para display
  static final List<Object> _contentWidgets = [
    NewsList(),
    VideosList(),
    LearnsList(),
    EventsList(),
    MorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    //Condicional para lidar com erros
    if (_error) {
      return Scaffold(
        body: Center(
          child: Text('something whent wrong!!'),
        ),
      );
    }

    //Condicional para mostrar loading widget
    if (!_initialized) {
      return Loading();
    }

    //Main APP
    return Scaffold(
      appBar: Platform.isIOS
          ? CupertinoNavigationBar(
              middle: Text(
                _tituloText[_titleIndex]['titleText'],
              ),
            )
          : AppBar(
              title: Text(
                _tituloText[_titleIndex]['titleText'],
              ),
            ),
      body: SafeArea(
        child: _contentWidgets.elementAt(
          _contentIndex,
        ),
      ),
      bottomNavigationBar: BotNavBar(
        selectedIndex: _selectedIndex,
        onTap: _changeContentsIndex,
      ),
    );
  }

  //inicializar firebase (metodo asincrono)
  void initFirebase() async {
    try {
      await Firebase.initializeApp();
      setState(
        () {
          _initialized = true;
        },
      );
    } catch (e) {
      setState(
        () {
          _error = true;
        },
      );
    }
  }

  //funçao para checar se é a primeira inicializaçao do app
  void _isFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('first_time');
    if (isFirstTime != null && !isFirstTime) {
      print('Nao é a sua primeira vez.');
      return;
    }
    await prefs.setBool('first_time', false);
    FirebaseMessaging.instance.subscribeToTopic('geral');
    print('Essa foi a sua primeira vez.');
  }

  //funçao para mudar conteudo de cada tab
  void _changeContentsIndex(int index) {
    setState(
      () {
        _selectedIndex = index;
        _titleIndex = index;
        _contentIndex = index;
      },
    );
  }
}
