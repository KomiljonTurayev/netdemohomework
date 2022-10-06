import 'dart:convert';

import 'package:http/http.dart';

import '../model/user.dart';

class Network {
  static String BASE = "dummy.restapiexample.com";

  //                    dummy.restapiexample.com/api/v1/employees
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

/*Http Apis */
  static String API_LIST = "/api/v1/employees";
  static String API_LIST_ID = "/api/v1/employee/1"; // {id}
  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/api/v1/update/"; //{id}
  static String API_DELETE = "/api/v1/delete/"; //{id}

/*Http Requests */

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> GETID(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> CREATE(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> UPDATEID(
      String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DELETEID(
      String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);
    var response =
        await delete(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, String> paramsCreate(User post) {
    Map<String, String> params = {};
    params.addAll({
      'name': post.name,
      'salary': post.salary,
      'age': post.age.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(User post) {
    Map<String, String> params = {};
    params.addAll({
      'id': post.id.toString(),
      'name': post.name,
      'salary': post.salary,
      'age': post.age.toString(),
    });
    return params;
  }
}
