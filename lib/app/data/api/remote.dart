import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_firebase/app/data/models/request/userRequest.dart';
import 'package:flutter_firebase/app/data/models/response/userResponse.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/error/failure.dart';

final remoteApiProvider = Provider<RemoteApi>((ref) => RemoteApi());

class RemoteApi {
  static const String url = 'http://192.168.137.1:8000/login';

  Future<UserResponse> getUser(UserRequest request) async {
    var u;
    try {

      final response = await Dio()
          .get(url,
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }),
        data: jsonEncode(request.toMap()),
      );

      // Récupérer réponse
      if (response.statusCode == 200) {
            final data = response.data;
            print(data);
            final results = data['data'];
            if (results.isNotEmpty) {
                print(results);
                var user = UserResponse.fromMap(results[0]);
                return user;
            }
      }

      return u;

    } on DioError catch (err) {
        if (kDebugMode) {
          print(err);
        }
      throw Failure(message: err.response?.statusMessage ?? 'Something went wrong!');
    } on SocketException catch (err) {
      print(err);
      throw const Failure(message: 'Please check your connection.');
    }
  }
}
