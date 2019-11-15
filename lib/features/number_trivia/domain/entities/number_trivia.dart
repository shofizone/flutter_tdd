import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'number_trivia.g.dart';

@JsonSerializable()
class NumberTrivia extends Equatable {
  @JsonKey(name: 'text')
  final String text;
  @JsonKey(name: 'number')
  final String number;

  NumberTrivia({@required this.text, @required this.number})
      : super([text, number]);

  factory NumberTrivia.fromJson(Map<String, dynamic> json) =>
      _$NumberTriviaFromJson(json);

  Map<String, dynamic> toJson() => _$NumberTriviaToJson(this);
}
