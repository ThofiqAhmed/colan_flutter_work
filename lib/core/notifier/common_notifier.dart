import 'dart:collection';

import 'package:flutter_sample_code/core/data/remote/repository/common_repository.dart';
import 'package:flutter_sample_code/core/data/remote/request_response/user/user_detail_response.dart';
import 'package:flutter_sample_code/core/data/remote/request_response/wishlist/wish_list_item_response.dart';
import 'package:flutter_sample_code/core/data/remote/request_response/wishlist/wish_list_response.dart';
import 'package:flutter_sample_code/core/model/BasicWishListInfo.dart';
import 'package:flutter_sample_code/core/model/basic_cart_info.dart';
import 'package:flutter_sample_code/core/model/basic_popular_product_info.dart';
import 'package:flutter_sample_code/utils/app_log_helper.dart';

import 'base/base_notifier.dart';

class CommonNotifier extends BaseNotifier {
  CommonNotifier._internal();

  static final CommonNotifier _singleInstance = CommonNotifier._internal();

  factory CommonNotifier() => _singleInstance;

  final _log = getLogger('CommonNotifier');

  //common needed values for app
  final _commonRepository = CommonRepository();
  String _adminToken = '';
  String _userToken = '';
  String _quoteId = '';
  String _userCountry;
  String _userState;
  String _cartCount;
  String _termsAndCondition = "";
  String _privacyPolicy = "";
  UserDetailResponse _userDetail;

  HashMap<String, BasicCartInfo> hmCartBasicInfo = HashMap();
  HashMap<String, BasicPopularProductInfo> hmPopularProductInfo = HashMap();
  HashMap<String, BasicWishListInfo> hmWishListInfo = HashMap();

  String get termsAndCondition => _termsAndCondition;

  set termsAndCondition(String token) {
    this._termsAndCondition = token.isNotEmpty ? token : '';
  }

  String get privacyPolicy => _privacyPolicy;

  set privacyPolicy(String token) {
    this._privacyPolicy = token.isNotEmpty ? token : '';
  }

  UserDetailResponse get userDetail => _userDetail;

  set userDetail(UserDetailResponse value) {
    _userDetail = value;
    log.i('updated : userProfileInfo');
  }

  String get adminToken => _adminToken;

  set adminToken(String token) {
    this._adminToken = token.isNotEmpty ? token : '';
    log.i('updated : admin token = ${this._adminToken}');
  }

  String get userToken => _userToken;

  set userToken(String token) {
    this._userToken = token.isNotEmpty ? token : '';
    log.i('updated : user token = ${this._userToken}');
  }

  String get quoteId => _quoteId;

  set quoteId(String quoteId) {
    this._quoteId = quoteId.isNotEmpty ? quoteId : '';
    log.i('updated : quoteId = ${this._quoteId}');
  }

  String get userCountry => _userCountry;

  set userCountry(String value) {
    this._userCountry = value.isNotEmpty ? value : '';
    log.i('updated : userCountry = ${this._userCountry}');
  }

  String get userState => _userState;

  set userState(String value) {
    this._userState = value.isNotEmpty ? value : '';
    log.i('updated : userState = ${this._userState}');
  }

  String get cartCount => _cartCount;

  set cartCount(String value) {
    _cartCount = value;
    notifyListeners();
    log.i('updated : cartCount = $value');
  }

  //api: get add to wish list
  Future<WishListItemResponse> callApiAddToWishList(String productId) async {
    log.i('api ::: callApiAddToWishList called');
    WishListItemResponse response = await _commonRepository.addToWishList(CommonNotifier().userToken, productId);
    return response;
  }

  void onNewWishListResponse(WishListResponse response) {
    hmWishListInfo.clear();
    response.wishList.forEach((item) {
      hmWishListInfo[item.productId] =
          BasicWishListInfo(productId: item.productId, wishListItemId: item.wishlistItemId);
    });
  }

  //clear common model resource
  cleanResource() {
    log.i('resourse clean : started in common notifier');
    _userToken = null;
    _quoteId = null;
    userCountry = null;
    userState = null;
    log.i('resourse cleaned in common notifier');
  }
}
