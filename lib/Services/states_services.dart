import 'dart:convert';

import 'package:covid_tracker/Modal/world_states_modal.dart';
import 'package:covid_tracker/Services/Utilities/Appuri.dart';
import 'package:http/http.dart' as http;

class StateServices {
  Future<WorldStatesModel> FetchWorldStatesData() async {
    var response = await http.get(Uri.parse(AppURL.worldStatesApi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> FetchWorldlist() async {
    var response = await http.get(Uri.parse(AppURL.countriesList));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return data;
    } else {
      throw Exception('Error');
    }
  }
}
