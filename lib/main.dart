import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motion/motion.dart';
import 'package:provider/provider.dart';

import 'Ludo/UI/Homescreen/Splash.dart';
import 'cashfree_provider.dart';
import 'ludo_provider.dart';
import 'view_model/create_joine_view_model.dart';
import 'view_model/firebase_view_model.dart';
import 'view_model/join_match_view_model.dart';

Future<void> main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  Firebase.initializeApp();
  await Motion.instance.initialize();
  Motion.instance.setUpdateInterval(70.fps);

  return runApp(ChangeNotifierProvider(
    create: (_) => LudoProvider(),
    child: const Root(),

  ));
}



class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {


  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=kIsWeb?400:MediaQuery.of(context).size.width;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseViewModel()),
        ChangeNotifierProvider(create: (_) => CreateJoinViewModel()),
        ChangeNotifierProvider(create: (_) => JoinViewModel()),
        ChangeNotifierProvider(create: (_) => PaymentService()),

      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
           home: FSplashscreen(),
        // home: mysplsh(),

      ),
    );
  }
}
double height=0.0;
double width=0.0;