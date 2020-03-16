import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Sobre'),
          backgroundColor: Colors.blue[900],
          elevation: 0.0,
        ),
        bottomNavigationBar: Container(
          height: 50.0,
          color: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50),
              Center(
                child: Text(
                  'Cardápio RU - UNIFEI',
                  style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text('Versão 1.0.0',
                    style: new TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic)),
              ),
              SizedBox(height: 100),
              SvgPicture.asset('assets/images/about.svg',
                  width: 200,
                  semanticsLabel: 'Um homem olhando para o computador'),
              SizedBox(height: 50),
              Center(
                child: RichText(
                  text: new TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(text: 'Desenvolvido por '),
                      new TextSpan(
                          text: 'Rafael Framil',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: (Text(
                  'Sugestões, bugs ou elogios enviar e-mail',
                  overflow: TextOverflow.ellipsis,
                )),
              ),
              SizedBox(height: 5),
              Center(
                child: Text('raframil@gmail.com',
                    style: new TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w900)),
              ),
            ],
          ),
        ));
  }
}
