
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ttd_clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';
part 'number_trivia_model.g.dart';

//flutter pub run build_runner build

@JsonSerializable()
class NumberTriviaModel extends NumberTrivia{


  NumberTriviaModel({
    @required String text,
    @required int number,
}): super(text:text,number:number);





  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) =>
      _$NumberTriviaModelFromJson(json);

  Map<String, dynamic> toJson() => _$NumberTriviaModelToJson(this);
}