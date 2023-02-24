


import 'package:dio/dio.dart';

import 'api.dart';
import 'constants.dart';


class CardImageController {
  ApiQuery apiQuery =ApiQuery();

  Future<Response?> getCardBackGroundImage() async {
    try{
      Map<String ,dynamic> data ={};

      Map<String ,String> headers ={};
      headers ={
        'Content-Type':'application/json',
      };
      Response? response =await apiQuery.getQuery(
          Constants.cards, headers, data, 'getCardImage', false, true, true);

      if(response ! == null && (response.statusCode == 303 ||
          response.statusCode== 401)){
        Map<String ,String> headers2={};
        headers2 ={
          'Content-Type':'application/json',
        };
        Response? response =await apiQuery.getQuery(
            Constants.cards,
            headers,
            data,
            'getCardImage',
            false,
            true,
            true);

        return response;
      }else {
        return response;
      }

    }catch(exception){
      print(exception.toString());
      return null;
    }
  }
}








//
//
// import 'package:flutter/material.dart';
//
//
// import '../cardImage2/model.dart';
// import 'api.dart';
//
// class CardImageController extends ChangeNotifier {
//   final ApiProvider apiProvider = ApiProvider();
//   List<Carding> _cardImages = [];
//   bool _isLoading = false;
//   String _errorMessage = "";
//
//   List<Carding> get cardImages => _cardImages;
//   bool get isLoading => _isLoading;
//   String get errorMessage => _errorMessage;
//
//   set cardImages(List<Carding> value) {
//     _cardImages = value;
//     notifyListeners();
//   }
//
//   set isLoading(bool value) {
//     _isLoading = value;
//     notifyListeners();
//   }
//
//   set errorMessage(String value) {
//     _errorMessage = value;
//     notifyListeners();
//   }
//
//   Future<void> fetchCardImages() async {
//     isLoading = true;
//     try {
//       final cardImages = await apiProvider.fetchCardImages();
//       cardImages.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
//       this.cardImages = cardImages;
//     } catch (error) {
//       errorMessage = error.toString();
//     } finally {
//       isLoading = false;
//     }
//   }
// }
