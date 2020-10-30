import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:retaurant_app/config/appConstants.dart';
import 'package:retaurant_app/http/httpService.dart';
import 'package:retaurant_app/model/tableInfoModel.dart';


class TableInfoService {
  Future<TableInfoModel> getTableInfo(String person, String reserveDate,String reserveTime) async {
    TableInfoModel tableInfoModel;

    HttpService httpService = new HttpService.internal();

    Map<String, String> requestBody = <String, String>{
      'person': person,
      'reservedate': reserveDate,
      'reservetime': reserveTime
    };

    final http.Response response = await httpService.postRequest(
        APIConstants.tableInfoEndpoint, requestBody);

    if (response.statusCode == 200) {
      print("response body  in tabl service: ${response.body}");

      var json = jsonDecode(response.body);

      tableInfoModel = TableInfoModel.fromJson(json);
    } else {
      throw Exception("Table service: Failed to get table info");
    }

    return tableInfoModel;
  }
}
