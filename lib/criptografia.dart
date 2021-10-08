import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';

class HomePage extends StatelessWidget {
  var textController = TextEditingController();
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
            TextField(
              controller: textController,
              decoration: InputDecoration(
                  labelText: 'Clique aqui para digitar',
                  hintText:
                      'Digite aqui!!!'), //labelText:Texto que aparece hintText: testo que aparece quando precionado
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                //Primeiro converte para o formato UTF8
                var bytes = utf8.encode(textController.text);

                //DEPOIS codifica do formato UTF-8 para Sha256
                var sha = sha256.convert(bytes);

                print("Texto Original: ${textController.text}");
                print("Texto criptografado SHA-1:" + sha.toString());
                print(sha.toString());
                //print("Variavel a:${a}");
              },
              child: Text("OK"),
            ),
          ],
        ),
      ),
    );
  }
}
