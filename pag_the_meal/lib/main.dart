import 'package:flutter/material.dart';
import 'package:pag_the_meal/screens/login_screen.dart';
import 'package:pag_the_meal/stores/login_store.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<LoginStore>(
      create: (_) => LoginStore(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreen(), //HomeScreen(),
      )
    );
  }
}
