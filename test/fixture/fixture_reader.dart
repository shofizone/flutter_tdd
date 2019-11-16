import 'dart:io';

String fixture(String name){
  var data = File('fixture/$name').readAsStringSync();
  print(data);

  return data;
}