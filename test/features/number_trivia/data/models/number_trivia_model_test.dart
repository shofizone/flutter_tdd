import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:ttd_clean_architecture/features/number_trivia/data/datasource/models/number_trivia_model.dart';
import 'package:ttd_clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';

import '../../../../fixture/fixture_reader.dart';




void main(){
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text:"Test Text");


  test("should be a subclass of NumberTrivia entity",()async{
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });


  group("fromJson", (){
    test("Should return a valid model when the JSON number is an integer",(){

      /// arrange
      final Map<String,dynamic> jsonMap =  json.decode(fixture('trivia.json'));

      /// act
      final result = NumberTriviaModel.fromJson(jsonMap);
      
      /// assert
      expect(result, tNumberTriviaModel);
      
    });

    test("Should return a valid model when the JSON number is an double",(){

      /// arrange
      final Map<String,dynamic> jsonMap =  json.decode(fixture('trivia_double.json'));

      /// act
      final result = NumberTriviaModel.fromJson(jsonMap);

      /// assert
      expect(result, tNumberTriviaModel);

    });
  });
}