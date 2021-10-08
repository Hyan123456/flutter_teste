import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  var textController = TextEditingController();
  var i = 0;
  var a = "nada aqui";
  var b = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: Text(
              "Cripitografia",
              style: TextStyle(fontSize: 100),
            ),
          ),
          Text("O valor e de : " + i.toString()),
          TextField(
            controller: textController,
            decoration: InputDecoration(
                labelText: 'Clique aqui para digitar',
                hintText:
                    'Digite aqui!!!'), //labelText:Texto que aparece hintText: testo que aparece quando precionado
          ),
          TextButton(
            onPressed: () {
              if (b == false) {
                a = "";
                b = true;
              }
              //Primeiro converte para o formato UTF8
              var bytes = utf8.encode(textController.text);

              //DEPOIS codifica do formato UTF-8 para Sha256
              var sha = sha256.convert(bytes);

              setState(() {
                i++;
                print("Texto Original: ${textController.text}");
                print("Texto criptografado SHA-1:" + sha.toString());
                a = a +
                    "\nTexto original : ${textController.text} Crypto SHA256 :" +
                    sha.toString() +
                    "\n";
              });
            },
            child: Text("Soma + 1"),
          ),
          Text(a),
        ],
      )),
    );
  }
}
