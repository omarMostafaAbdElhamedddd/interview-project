
import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class UnitsStates {}
class LoadingState extends UnitsStates{}
class SuccessState extends UnitsStates{}
class FailureState extends UnitsStates{}


class Unit {
  int id ;
  String name ;


  Unit({required this.name, required this.id});
  factory Unit.fromjson(json){
    return Unit(name: json['name'] ?? 'Any name', id:json['id']??0);
  }
}

class FetchUnits {
  Future<List<Unit>> fetchUnits () async{
    String url = 'http://appydev-001-site2.atempurl.com/Unit';
    final response = await http.get(Uri.parse(url));

    List<dynamic> units = jsonDecode(response.body);

    List<Unit> unitsList = [];

    for(int i=0 ;i<units.length;i++){
      unitsList.add(Unit.fromjson(units[i]));
    }
    return unitsList;
  }
}