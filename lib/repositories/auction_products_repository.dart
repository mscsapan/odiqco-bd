import 'dart:convert';

import 'package:active_ecommerce_cms_demo_app/data_model/auction_product_bid_place_response.dart';
import 'package:active_ecommerce_cms_demo_app/repositories/api-request.dart';

import '../app_config.dart';
import '../data_model/auction_bidded_products.dart';
import '../data_model/auction_product_details_response.dart';
import '../data_model/auction_purchase_history_response.dart';
import '../data_model/product_mini_response.dart';
import '../helpers/shared_value_helper.dart';

class AuctionProductsRepository {
  Future<ProductMiniResponse> getAuctionProducts({page = 1}) async {
    String url = ("${AppConfig.BASE_URL}/auction/products?page=$page");
    final response = await ApiRequest.get(url: url, headers: {
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
    });
    return productMiniResponseFromJson(response.body);
  }

  Future<AuctionProductDetailsResponse> getAuctionProductsDetails(
      String slug) async {
    String url = ("${AppConfig.BASE_URL}/auction/products/$slug");
    final response = await ApiRequest.get(url: url, headers: {
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
    });
    return auctionProductDetailsResponseFromJson(response.body);
  }

  Future<AuctionProductPlaceBidResponse> placeBidResponse(
      String productId, String amount) async {
    var postBody = jsonEncode({
      "product_id": productId,
      "amount": amount,
    });

    String url = ("${AppConfig.BASE_URL}/auction/place-bid");
    final response = await ApiRequest.post(
        url: url,
        headers: {
          "Accept": "*/*",
          "Content-Type": "application/json",
          "App-Language": app_language.$!,
          "Authorization": "Bearer ${access_token.$}"
        },
        body: postBody);

    return auctionProductPlaceBidResponseFromJson(response.body);
  }

  Future<AuctionBiddedProducts> getAuctionBiddedProducts({
    page = 1,
  }) async {
    String url = ("${AppConfig.BASE_URL}/auction/bided-products?page=$page");
    final response = await ApiRequest.get(url: url, headers: {
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
    });
    return auctionBiddedProductsFromJson(response.body);
  }

  Future<AuctionPurchaseHistoryResponse> getAuctionPurchaseHistory(
      {page = 1, payment_status = "", delivery_status = ""}) async {
    String url =
        ("${AppConfig.BASE_URL}/auction/purchase-history?page=$page&payment_status=$payment_status&delivery_status=$delivery_status");
    final response = await ApiRequest.get(url: url, headers: {
      "App-Language": app_language.$!,
      "Authorization": "Bearer ${access_token.$}",
    });
    return auctionPurchaseHistoryResponseFromJson(response.body);
  }
}
