
class DistributorWiseListResponse {
  List<DistributorWiseList> items;
  String message;
  int status;
  DistributorWiseListResponse({this.items,this.message,this.status});

  DistributorWiseListResponse.fromJson(List<dynamic> jsonArray) {
    items = jsonArray.map((item) => DistributorWiseList.fromJson(item)).toList();
  }


}




class DistributorWiseList {
  Data data;
  String message;
  int status;

  DistributorWiseList({this.data, this.message, this.status});

  DistributorWiseList.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  List<OrderedItemList> orderedItemList;

  Data({this.orderedItemList});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['ordered_item_list'] != null) {
      orderedItemList = new List<OrderedItemList>();
      json['ordered_item_list'].forEach((v) {
        orderedItemList.add(new OrderedItemList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderedItemList != null) {
      data['ordered_item_list'] =
          this.orderedItemList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderedItemList {
  String productId;
  String productName;
  String productSku;
  int quantity;
  String price;
  String total;
  String shopName;

  OrderedItemList(
      {this.productId,
        this.productName,
        this.productSku,
        this.quantity,
        this.price,
        this.total,
        this.shopName});

  OrderedItemList.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productSku = json['product_sku'];
    quantity = json['quantity'];
    price = json['price'];
    total = json['Total'];
    shopName = json['shop_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_sku'] = this.productSku;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['Total'] = this.total;
    data['shop_name'] = this.shopName;
    return data;
  }
}