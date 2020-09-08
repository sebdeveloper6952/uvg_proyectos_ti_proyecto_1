import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final Future<FirebaseApp> _init = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('Card tapped.');
                  },
                  child: Container(
                      width: 300,
                      height: 100,
                      child: Center(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Text.rich(
                              TextSpan(
                                  text: 'Lecturas',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ),
                            Text.rich(
                              TextSpan(
                                  text:
                                      'Realiza las lecturas sobre el libro de PMBOK',
                                  style: TextStyle(fontSize: 12)),
                            )
                          ]))),
                ),
                elevation: 5,
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('Card tapped.');
                  },
                  child: Container(
                      width: 300,
                      height: 100,
                      child: Center(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Text.rich(
                              TextSpan(
                                  text: 'Jueguito',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ),
                            Text.rich(
                              TextSpan(
                                  text:
                                      'Pon a prueba tu conocimiento sobre PMBOK',
                                  style: TextStyle(fontSize: 12)),
                            )
                          ]))),
                ),
                elevation: 5,
              ),
            ],
          ),
        ));
  }
}
