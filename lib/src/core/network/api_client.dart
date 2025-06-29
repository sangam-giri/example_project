import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final _client = http.Client();

  Future<Either<String, T>> get<T>(String endpoint) async {
    final response = await _client.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      return Right(jsonDecode(response.body));
    } else {
      return Left('Could not fetch');
    }
  }
}
