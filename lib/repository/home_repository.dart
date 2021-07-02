
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:myfeveret_task_yousuf/models/trending_seller.dart';
import 'package:myfeveret_task_yousuf/utils/api_urls.dart';
import 'package:myfeveret_task_yousuf/utils/app_exceptions.dart';
import 'package:path_provider/path_provider.dart';

class HomeRepository {

  Future getTrendingSellers() async {
    String fileName = "userdata.json";

    var dir = await getTemporaryDirectory();

    File file = new File(dir.path + "/" + fileName);

    print("fetch trending seller...");
    var headers = {
      'content-type': 'application/json',
      'Accept': 'application/json',
    };

    Uri mUri = Uri.parse(ApiUrl.trendingSeller);
    var responseJson;
    try {
      print("Loading from API");
      final response =
      await http.get(mUri, headers: headers);
      responseJson = _returnResponse(response);
      //List<List<TrendingSeller>> treadingSellers = trendingSellerFromJson(response.body);
      //String m = jsonEncode(response.body);
      //save json in local file
      //jsonEncode(TrendingSeller.fromJson(treadingSellers[0][0].toJson()));
      //TrendingSeller.f(json.encode(response.body)

      file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);
    } on SocketException {
      if (file.existsSync()) {
        print("Loading from cache");
        String jsonBody = file.readAsStringSync();
        print("cache-> $jsonBody");
        //List<List<TrendingSeller>> trendingSellerFromJson(String str) => List<List<TrendingSeller>>.from(json.decode(str).map((x) => List<TrendingSeller>.from(x.map((x) => TrendingSeller.fromJson(x)))));
        //responseJson = trendingSellerFromJson(jsonBody);
        //return responseJson;
        responseJson = file.readAsStringSync();
      }
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
      throw BadRequestException(response.body);
    case 401:
    case 403:
      throw UnauthorisedException(response.body);
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}