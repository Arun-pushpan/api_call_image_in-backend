
import 'dart:convert';
import 'package:dio/dio.dart' as r;


import 'package:flutter/material.dart';

import '../cardImage2/model.dart';
import 'controller.dart';
import 'model.dart';

class Template extends StatefulWidget {
  const Template({Key? key}) : super(key: key);

  @override
  State<Template> createState() => _TemplateState();
}

class _TemplateState extends State<Template> {

  final CardImageController cardImageController = CardImageController();
  late Carding imageId;
  late bool isLoading;
  late List<Carding?>_cardimageList;

  void initState() {
    isLoading = false;
    super.initState();
    _cardimageList = [];
    getCardImage();
  }

  Future<void> refresh() async {
    getCardImage();
    await Future.delayed(const Duration(seconds: 2), () {});
  }

  getCardImage() async {
    try {
      setState(() {
        isLoading = true;
      });

      /// edit response code
      final response = await CardImageController().getCardBackGroundImage();

      if (response!.statusCode == 200) {
        final s1 = json.encode(response.data);
        CardImageModel cardImageModel = cardImageModelFromJson(s1);
        _cardimageList = cardImageModel.cards;
      }
      //isLoading = false;
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e.toString());
      setState(() {
        isLoading = false;
      });
    }
  }


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
            Image.network(_cardimageList[0]!.cardImages.imageUrl),
            SizedBox(height: 16.0),
            // Display the card information
            Text("Full Name: ${_cardimageList[0]!.fullName}"),
            Text("Email: ${_cardimageList[0]!.email}"),
            Text("Phone: ${_cardimageList[0]!.phone}"),
           Text("Card Type: ${_cardimageList[0]!.cardType}"),
          ],
        ),
      ),
    );
  }
}























