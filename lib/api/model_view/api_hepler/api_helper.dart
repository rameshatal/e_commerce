import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiCalling {
  static Future<ApiHandler> getApi({required String uri})async{
    try{
      http.Response data = await http.get(Uri.parse(uri));
      if(data.statusCode==200){
        return ApiHandler.withSuccess(data);
      } else{
        return ApiHandler.withError(data);
      }
    } on http.ClientException{
      return ApiHandler.withError("NO internet connection");
    } on SocketException {
      return ApiHandler.withError("NO internet connection");
    } catch (e, a) {
      return ApiHandler.withError(e.toString());
    }
  }

  /*static Future<ApiHandler> getApi({required String uri}) async {
    try {
      http.Response data = await http.get(Uri.parse(uri),);
      if (data.statusCode == 200) {
        return ApiHandler.withSuccess(data);
      } else {
        return ApiHandler.withError(data);
      }
    } catch (e) {
      return ApiHandler.withError(e);
    }
  }*/
  static Future<ApiHandler> postApi({required String uri,required Map<String,dynamic>body})async{
    try{
      http.Response data = await http.post(Uri.parse(uri),body: jsonEncode(body),headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      });
      Map<String,dynamic>apiData = jsonDecode(data.body);
      if(data.statusCode==200 && apiData.containsKey('status') && apiData['status']==true){
        return ApiHandler.withSuccess(data);
      }else{
        return ApiHandler.withSuccess(data);
      }
    }catch(e){
      return ApiHandler.withError(e);
    }
  }
/*
  static Future<ApiHandler> postApi({required String uri, required Map<String, dynamic> body}) async {
    try {
      http.Response data =
          await http.post(Uri.parse(uri), body: jsonEncode(body), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      });
      Map<String, dynamic> apiData = jsonDecode(data.body);
      if (data.statusCode == 200 &&
          apiData.containsKey('status') &&
          apiData['status'] == true) {
        return ApiHandler.withSuccess(data);
      } else {
        return ApiHandler.withError(data);
      }
    } catch (e) {
      return ApiHandler.withError(e);
    }
  }
*/

  static Future<ApiHandler> putApi({required String uri, required Map<String, dynamic> body}) async {
    try {
      http.Response data = await http.put(
        Uri.parse(uri),
        body: jsonEncode(body),
      );
      if (data.statusCode == 200) {
        return ApiHandler.withSuccess(data);
      } else {
        return ApiHandler.withError(data);
      }
    } catch (e) {
      return ApiHandler.withError(e);
    }
  }

  static Future<ApiHandler> deleteApi({required String uri}) async {
    try {
      http.Response data = await http.delete(
        Uri.parse(uri),
      );
      if (data.statusCode == 200) {
        return ApiHandler.withSuccess(data);
      } else {
        return ApiHandler.withError(data);
      }
    } catch (e) {
      return ApiHandler.withError(e);
    }
  }
}

class ApiHandler {
  dynamic response;
  Errors? error;

  ApiHandler.withError(dynamic apiError) {
    response = null;
    if (apiError is String) {
      error = Errors(code: 500, message: apiError);
    } else if (apiError is http.Response) {
      switch (apiError.statusCode) {
        case 400:
          error = Errors(
              code: 400,
              message: "He server cannot or will not process the request due to something that is perceived to be a client error");
        case 401:
          error = Errors(
              code: 401,
              message:
              "The request has not been applied because it lacks valid authentication credentials for the target resource");
        case 403:
          error = Errors(
              code: 403,
              message: "Access to the requested resource is forbidden.");
        case 404:
          error = Errors(code: 404, message: "Url not found.");
        case 200:
          Map<String, dynamic> apiData = jsonDecode(apiError.body);
          error = Errors(code: 200, message: apiData['message']);
        case 422:
          Map<String, dynamic> apiData = jsonDecode(apiError.body);
          ErrorResponse errorResponse = ErrorResponse.errorHandler(apiData["errors"] ?? {});
          if (errorResponse.errorList.isNotEmpty) {
            error = Errors(code: 422, message: errorResponse.errorList.first);
          } else {
            error = Errors(code: 422, message: apiData['message'] ?? "Failed to load data - status code: ${apiError.statusCode}");
          }
          break;
        case 500:
          error = Errors(
              code: 500,
              message: "The server has encountered an unexpected condition or configuration problem that prevents it from fulfilling the request made by the browser or client");
        default:
          error = Errors(
              code: 500,
              message: "The server has encountered an unexpected condition or configuration problem that prevents it from fulfilling the request made by the browser or client");
      }
    }
  }

  ApiHandler.withSuccess(http.Response apiResponse) {
    response = jsonDecode(apiResponse.body);
    error = null;
  }
}

class Errors {
  final int code;
  final String message;
  Errors({required this.code, required this.message});
}

class ErrorResponse {
  List<String> errorList = [];
  ErrorResponse.errorHandler(Map<String, dynamic> error) {
    error.forEach((key, value) {
      errorList.add(value.first);
    });
  }
}
