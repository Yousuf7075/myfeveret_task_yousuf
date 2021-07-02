

import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:myfeveret_task_yousuf/utils/api_urls.dart';
import 'package:myfeveret_task_yousuf/utils/app_exceptions.dart';
import 'package:path_provider/path_provider.dart';

class HomeRepository {

  Future getTrendingSellers() async {
    print("fetch trending seller...");

    String fileName = "trending_seller.json";
    var dir = await getTemporaryDirectory();
    File file = new File(dir.path + "/" + fileName);

    var headers = {
      'content-type': 'application/json',
      'Accept': 'application/json',
    };

    Uri mUri = Uri.parse(ApiUrl.trendingSeller);
    var responseJson;
    try {

      //-----------Loading from server----------

      print("Loading from API");
      final response =
      await http.get(mUri, headers: headers);
      responseJson = _returnResponse(response);
      file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);
    } on SocketException {

      //-----------Loading from cache----------

      if (file.existsSync()) {
        print("Loading from cache");
        print("cache-> ${file.readAsStringSync()}");
        responseJson = file.readAsStringSync();
      }else{
        print('No net');
        throw FetchDataException('No Internet connection');
      }
    }
    return responseJson;
  }

  Future getTrendingProducts() async {
    print("fetch trending products...");

    String fileName = "trending_products.json";
    var dir = await getTemporaryDirectory();
    File file = new File(dir.path + "/" + fileName);

    var headers = {
      'content-type': 'application/json',
      'Accept': 'application/json',
    };

    Uri mUri = Uri.parse(ApiUrl.trendingProducts);
    var responseJson;
    try {

      //-----------Loading from server----------

      print("Loading from API");
      final response =
      await http.get(mUri, headers: headers);
      responseJson = _returnResponse(response);
      file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);
    } on SocketException {

      //-----------Loading from cache----------

      if (file.existsSync()) {
        print("Loading from cache");
        print("cache-> ${file.readAsStringSync()}");
        responseJson = file.readAsStringSync();
      }else{
        print('No net');
        throw FetchDataException('No Internet connection');
      }
    }
    return responseJson;
  }

  Future getNewArrivals() async {
    print("fetch new arrivals...");

    String fileName = "new_arrivals.json";
    var dir = await getTemporaryDirectory();
    File file = new File(dir.path + "/" + fileName);

    var headers = {
      'content-type': 'application/json',
      'Accept': 'application/json',
    };

    Uri mUri = Uri.parse(ApiUrl.newArrivals);
    var responseJson;
    try {

      //-----------Loading from server----------

      print("Loading from API");
      final response =
      await http.get(mUri, headers: headers);
      responseJson = _returnResponse(response);
      file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);
    } on SocketException {

      //-----------Loading from cache----------

      if (file.existsSync()) {
        print("Loading from cache");
        print("cache-> ${file.readAsStringSync()}");
        responseJson = file.readAsStringSync();
      }else{
        print('No net');
        throw FetchDataException('No Internet connection');
      }
    }
    return responseJson;
  }

  Future getNewShops() async {
    print("fetch new shops...");

    String fileName = "new_shops.json";
    var dir = await getTemporaryDirectory();
    File file = new File(dir.path + "/" + fileName);

    var headers = {
      'content-type': 'application/json',
      'Accept': 'application/json',
    };

    Uri mUri = Uri.parse(ApiUrl.newShops);
    var responseJson;
    try {

      //-----------Loading from server----------

      print("Loading from API");
      final response =
      await http.get(mUri, headers: headers);
      responseJson = _returnResponse(response);
      file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);
    } on SocketException {

      //-----------Loading from cache----------

      if (file.existsSync()) {
        print("Loading from cache");
        print("cache-> ${file.readAsStringSync()}");
        responseJson = file.readAsStringSync();
      }else{
        print('No net');
        throw FetchDataException('No Internet connection');
      }
    }
    return responseJson;
  }

  Future getProducts() async {
    print("fetch products...");

    String fileName = "products.json";
    var dir = await getTemporaryDirectory();
    File file = new File(dir.path + "/" + fileName);

    var headers = {
      'content-type': 'application/json',
      'Accept': 'application/json',
    };

    Uri mUri = Uri.parse(ApiUrl.products);
    var responseJson;
    try {

      //-----------Loading from server----------

      print("Loading from API");
      final response =
      await http.get(mUri, headers: headers);
      responseJson = _returnResponse(response);
      file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);
    } on SocketException {

      //-----------Loading from cache----------

      if (file.existsSync()) {
        print("Loading from cache");
        print("cache-> ${file.readAsStringSync()}");
        responseJson = file.readAsStringSync();
      }else{
        print('No net');
        throw FetchDataException('No Internet connection');
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