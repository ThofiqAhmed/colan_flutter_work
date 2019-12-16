import 'dart:convert';
import 'dart:io';

import 'package:flutter_sample_code/core/data/remote/network/app_url.dart';
import 'package:flutter_sample_code/core/data/remote/network/method.dart';
import 'package:flutter_sample_code/core/data/remote/request_response/wishlist/wish_list_item_response.dart';

import 'base/base_repository.dart';

class CommonRepository extends BaseRepository {
  CommonRepository._internal();

  static final CommonRepository _singleInstance = CommonRepository._internal();

  factory CommonRepository() => _singleInstance;

  //api: add to wish list
  Future<WishListItemResponse> addToWishList(String userToken, String productId) async {
    final response = await networkProvider.call(
      method: Method.POST,
      headers: buildDefaultHeaderWithToken(userToken),
      pathUrl: AppUrl.pathAddToWishList + productId,
    );

    if (response.statusCode == HttpStatus.ok) {
      if (response.body != null) {
        return WishListItemResponse(success: "true");
      } else {
        return WishListItemResponse.fromJson(json.decode(response.body));
      }
    } else {
      return null;
    }
  }
}
