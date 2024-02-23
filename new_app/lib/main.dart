import 'package:flutter/material.dart';
import 'package:new_app/splaceScreen.dart';
import 'package:provider/provider.dart';

import 'Homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Widget1Provider>(create: (_) => Widget1Provider()),
        ChangeNotifierProvider<Widget2Provider>(create: (_) => Widget2Provider()),
        ChangeNotifierProvider<Widget3Provider>(create: (_) => Widget3Provider()),
        ChangeNotifierProvider<Widget4Provider>(create: (_) => Widget4Provider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
