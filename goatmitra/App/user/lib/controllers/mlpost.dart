import "dart:convert";
import "dart:ffi";

import "package:flutter/material.dart";

import "package:http/http.dart" as http;
import "package:user/Models/healthModel.dart";

class Http{
  static Future<String> post({
    required String weight,
    required String height,
    required String fever,
    required String lethargy,
    required String diarrhea,
    required String runningNose,
    required String coughingSneezing,
    required String coatChanges
  }) async {
    try {
      final data=detailsModel(weight: weight, height: height, fever: fever, lethargy: lethargy, diarrhea: diarrhea, runningNose: runningNose, coughingSneezing: coughingSneezing, coatChanges: coatChanges);
      print(data.toMap());
      final response = await http.post(
  Uri.parse("http://100.72.58.252:9000/predict/text"),
  headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  },
  body: jsonEncode(data.toMap()),
);
      if(response.statusCode==200){
        final pred = json.decode(response.body)['prediction'];
        print(pred);
        return pred;
      }
      else{
        throw Exception("Failed to get");
      }
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  // static Future<Product> post(Map<String,dynamic> data) async {
  //   try {
  //     final response=await http.post(Uri.parse("http://192.168.29.21:3000/api/products/"),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode(data)
  //     );
  //    if(response.statusCode==200){
  //       return Product.fromJson(jsonDecode(response.body));
  //     }
  //     else{
  //       throw Exception("Failed to get");
  //     }
  //   } on Exception catch (err) {
  //     throw Exception(err);
  //   }
  // }
}
