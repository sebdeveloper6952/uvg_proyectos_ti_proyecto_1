import 'package:flutter/material.dart';
import 'package:flutter_proyecto_1/utils.dart';
import 'package:provider/provider.dart';
import 'package:flutter_proyecto_1/router.dart';
import '../services/auth_service.dart';
import 'package:flutter_proyecto_1/shared/progress_dialog.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _passFNode = FocusNode();
  String email, pw;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Registro de usuario"),
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
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => email = value,
                    decoration: const InputDecoration(
                      hintText: 'Ingrese su usuario',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor ingresa un usuario, haragán';
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) {
                      _passFNode.requestFocus();
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                      focusNode: _passFNode,
                      obscureText: true,
                      onChanged: (value) => pw = value,
                      decoration: InputDecoration(
                        hintText: 'Contraseña',
                      ),
                      validator: (value) {
                        if (value.isEmpty || value.length < 8) {
                          return 'Ingrese una contraseña con más de 8 caracteres.';
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
                        /// mostrar dialogo de progreso
                        Utils.showProgressDialog(context, 'Creando cuenta...');
                        bool result = await context
                            .read<AuthService>()
                            .createUser(email, pw);
                        /* con esto se "quita" la pantalla que esta hasta arriba
                           del "stack" de pantallas, en este caso es el dialogo
                           de progreso */
                        Navigator.pop(context);

                        /// mostrar snackbar
                        SnackBar notification;
                        if (result) {
                          notification =
                              SnackBar(content: Text('Usuario registrado:)'));
                        } else {
                          notification = SnackBar(
                              content: Text(
                                  'Felicidades, no se ha creado el usuario'));
                        }
                        _scaffoldKey.currentState.showSnackBar(notification);
                      }
                    },
                    child: Text('Crear usuario'),
                  ),
                ),
                Container(
                  child: FlatButton(
                    onPressed: () {
                      FluroRouter.router
                          .navigateTo(context, '/login', clearStack: true);
                    },
                    child: Text(
                      "Ya tienes cuenta?",
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
