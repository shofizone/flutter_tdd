import 'dart:io';

String fixture(String name){
  var data = File('fixture/$name').readAsStringSync();


  return data;
}