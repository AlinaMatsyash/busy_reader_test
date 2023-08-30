import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../models/book_model.dart';

abstract class BookRemoteDataSource {
  Future<BookModel> getBook();
}

class BookRemoteDataSourceImpl implements BookRemoteDataSource {
  final http.Client client;

  BookRemoteDataSourceImpl({required this.client});

  @override
  Future<BookModel> getBook() =>
      _getBookFromUrl('http://numbersapi.com/random');

  Future<BookModel> _getBookFromUrl(String url) async {
    String data = await rootBundle.loadString('assets/json/sample.json');
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return BookModel.fromJson(json.decode(data));
    } else {
      throw ServerException();
    }
  }
}
