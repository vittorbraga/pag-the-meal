import 'package:flutter/material.dart';
import 'package:pag_the_meal/screens/home_screen.dart';
import 'package:pag_the_meal/stores/login_store.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScrennState createState() => _LoginScrennState();
}

class _LoginScrennState extends State<LoginScreen> {
  LoginStore _loginStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loginStore = Provider.of<LoginStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlineButton(
          onPressed: () {
            _loginStore.signInWithGoogle().then((value) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HomeScreen())
              );
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40)
          ),
          highlightElevation: 0,
          borderSide: BorderSide(color: Colors.grey),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Login com o Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ),
        )
      ),
    );
  }
}