


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model.dart';

class DisplayPage extends StatelessWidget {
  final CardImageModel cardImageModel;

  DisplayPage({required this.cardImageModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: Text("Card Image"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the image using the Image.network widget
            Image.network(cardImageModel.cards[0].cardImages.imageUrl),
            SizedBox(height: 16.0),
            // Display the card information
            Text("Full Name: ${cardImageModel.cards[0].fullName}"),
            Text("Email: ${cardImageModel.cards[0].email}"),
            Text("Phone: ${cardImageModel.cards[0].phone}"),
            Text("Card Type: ${cardImageModel.cards[0].cardType}"),
          ],
        ),
      ),
    );
  }
}
