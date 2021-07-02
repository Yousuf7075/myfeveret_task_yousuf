import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:myfeveret_task_yousuf/utils/api_urls.dart';
import 'package:myfeveret_task_yousuf/utils/app_exceptions.dart';

class HomeRepository {

  Future getTrendingSellers() async {
    print("fetch trending seller...");
    var headers = {
      'content-type': 'application/json',
      'Accept': 'application/json',
    };

    Uri mUri = Uri.parse(ApiUrl.trendingSeller);
    var responseJson;
    try {
      responseJson =
      await http.get(mUri, headers: headers);
      //responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = response.body;
      print(responseJson);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}