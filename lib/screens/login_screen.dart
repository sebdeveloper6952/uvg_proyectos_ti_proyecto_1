import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_proyecto_1/router.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email, pw;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("LOGIN"),
        centerTitle: true,
        actionsIconTheme:
            IconThemeData(size: 30.0, color: Colors.black, opacity: 10.0),
      ),
      body: Center(
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    onChanged: (value) => email = value,
                    decoration: const InputDecoration(
                      hintText: 'Ingrese su usuario',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor ingresa un usuario.';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                      onChanged: (value) => pw = value,
                      decoration: InputDecoration(
                        hintText: 'Contraseña',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Ingrese su contraseña.';
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () async {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState.validate()) {
                        // Process data.
                        bool result =
                            await context.read<AuthService>().login(email, pw);
                        SnackBar notification;
                        if (result) {
                          FluroRouter.router
                              .navigateTo(context, '/home', clearStack: true);
                        } else {
                          notification =
                              SnackBar(content: Text('Usuario incorrecto'));
                        }
                        _scaffoldKey.currentState.showSnackBar(notification);
                      }
                    },
                    child: Text('Ingresar'),
                  ),
                ),
                Container(
                  child: FlatButton(
                    onPressed: () {
                      FluroRouter.router.navigateTo(context, '/register');
                    },
                    child: Text(
                      "No tienes cuenta?",
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
