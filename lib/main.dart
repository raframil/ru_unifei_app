import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:ru_unifei_app/screens/screens.dart';
import 'package:ru_unifei_app/services/push_notification.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PushNotificationService _notificationService = PushNotificationService();
  // Admob Start
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    nonPersonalizedAds: false,
    childDirected: false,
    keywords: <String>['aluguel', 'comida', 'restaurante', 'bar', 'cerveja', 'festa', 'imóveis'],
  );

  BannerAd _bannerAd;

  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: 'ca-app-pub-6196159010085856/5812522048',
        size: AdSize.banner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("BannerAd $event");
        });
  }

  @override
  void initState() {

    _notificationService.getToken();

    FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-6196159010085856~9751767052');
    _bannerAd = createBannerAd()
      ..load()
      ..show();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }
  // Admob Finish

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cardápio RU - UNIFEI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
