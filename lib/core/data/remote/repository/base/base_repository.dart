import 'dart:io';

import 'package:flutter_sample_code/core/data/remote/network/network_provider.dart';

class BaseRepository {
  final networkProvider = NetworkProvider();

  final headerContentTypeAndAccept = {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.acceptHeader: "application/json"
  };
  final Map<String, String> mapAuthHeader = {HttpHeaders.authorizationHeader: 'Bearer xxxxxxxxxxSAMPLExxxxxxxxxxxxx'};

  Map<String, String> buildDefaultHeaderWithToken(String token) {
    Map<String, String> header = headerContentTypeAndAccept;
    header.remove(HttpHeaders.authorizationHeader);
    header.putIfAbsent(HttpHeaders.authorizationHeader, () => getFormattedToken(token));
    return header;
  }

  Map<String, String> buildOnlyHeaderWithToken(String token) {
    Map<String, String> header = {};
    header.remove(HttpHeaders.authorizationHeader);
    header.putIfAbsent(HttpHeaders.authorizationHeader, () => getFormattedToken(token));
    return header;
  }

  String getFormattedToken(String token) {
    return 'Bearer $token';
  }
}
