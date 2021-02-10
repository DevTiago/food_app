import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:food_app/services/set_login.dart';
import 'package:page_transition/page_transition.dart';
import '../initial/initial_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = "";
  bool isLoading = false;


  void setLogin(email, password) async {

    SetLogin instance = SetLogin(email: email, password: password);
    setState(() => isLoading = true);
      await instance.login(email, password);

      if (!instance.isUser) {
        setState(() => isLoading = false);
        setState(() => error = "Dados de login incorretos");

      } else {
        setState(() => isLoading = false);
        setState(() => error = "");
        Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.fade, child: InitialScreen()));
      }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey[300], elevation: 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                color: Colors.grey[300],
                height: size.height / 6,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'login'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                        Text(
                          'Entre com o seu email e password',
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    Image.network(
                        "https://cdn1.iconfinder.com/data/icons/beverage-2/440/Asset_2-512.png")
                  ],
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Campo obrigatório' : null,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.grey)),
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        validator: (val) => val.length < 6
                            ? 'Password deve conter pelo menos 6 caracteres'
                            : null,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.grey)),
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: 5.0),
                      Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0)),
                      SizedBox(height: 20.0),
                      ButtonTheme(
                        minWidth: size.width,
                        height: 50.0,
                        child: RaisedButton(
                            color: Colors.orange[800],
                            child: !isLoading ? Text(
                              'LOGIN',
                              style: TextStyle(color: Colors.white),
                            ) : spinkit,
                            onPressed: ()  {
                               setLogin(email, password);

                            }),
                      ),
                      SizedBox(height: 20.0),
                      Text('OU', style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 20.0),
                      ButtonTheme(
                        minWidth: size.width,
                        height: 50.0,
                        child: RaisedButton(
                            color: Colors.blue[800],
                            child: Text(
                              'Iniciar Sessão com Facebook',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {}),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'Recuperar palavra-passe ou alterar nº de telefone',
                        style: TextStyle(
                            color: Colors.orange[800], fontSize: 12.0),
                      ),
                      SizedBox(height: 30.0),
                      RichText(
                          text: TextSpan(
                              text: "Novo no Pede&Come?",
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black),
                              children: <TextSpan>[
                            TextSpan(
                                text: ' Crie uma conta',
                                style: TextStyle(color: Colors.orange[800]))
                          ])),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

const spinkit = SpinKitWave(
  color: Colors.white,
  size: 20.0,
);