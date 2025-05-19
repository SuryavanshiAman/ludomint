
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ludo_score/firebase_options.dart';
import 'package:ludo_score/view_model/profile_view_model.dart';
import 'package:motion/motion.dart';
import 'package:provider/provider.dart';

import 'Ludo/UI/Homescreen/Splash.dart';
import 'cashfree_provider.dart';
import 'goggleAds/ads_helper_provider.dart';
import 'ludo_provider.dart';
import 'view_model/create_joine_view_model.dart';
import 'view_model/firebase_view_model.dart';
import 'view_model/join_match_view_model.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Motion.instance.initialize();
  Motion.instance.setUpdateInterval(70.fps);

  runApp(
    ChangeNotifierProvider(
      create: (_) => LudoProvider(),
      child: const Root(),
    ),
  );
}

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = kIsWeb ? 450 : MediaQuery.of(context).size.width;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseViewModel()),
        ChangeNotifierProvider(create: (_) => CreateJoinViewModel()),
        ChangeNotifierProvider(create: (_) => JoinViewModel()),
        ChangeNotifierProvider(create: (_) => PaymentService()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        ChangeNotifierProvider(create: (_) => AdsHelper()..initialize()),
      ],
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: width),
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: FSplashscreen(),
          ),
        ),
      ),
    );
  }
}

double height = 0.0;
double width = 0.0;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
