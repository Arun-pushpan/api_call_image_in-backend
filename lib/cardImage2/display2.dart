


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'controller.dart';
import 'display.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("View Card Image"),
          onPressed: () async {
            final cardImageModel = await CardImageController.getCardImage();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DisplayPage(
                  cardImageModel: cardImageModel,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
