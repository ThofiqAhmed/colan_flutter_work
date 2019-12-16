class FilterResponse {
  List<Data> data;
  String message;
  int status;

  FilterResponse({this.data, this.message, this.status});

  FilterResponse.fromJson(List<dynamic> response) {
    if (response != null) {
        Map<String, dynamic> json = response[0];
      if (json['data'] != null) {
        data = new List<Data>();
        json['data'].forEach((v) {
          data.add(new Data.fromJson(v));
        });
      }
      message = json['message'];
      status = json['status'];
    }
  }

  FilterResponse.fromErrorJson(Map<String, dynamic> json) {
    message = json['message'];
    status = 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String name;
  int flag;
  List<Items> items;

  Data({this.name, this.flag, this.items});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    flag = json['flag'];
    if (json['data'] != null) {
      items = new List<Items>();
      json['data'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['flag'] = this.flag;
    if (this.items != null) {
      data['data'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String code;
  String display;
  String id;
  Items(
      {
      this.code,
      this.display,
      this.id,});

  Items.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    display = json['display'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['display'] = this.display;
    data['id'] = this.id;
    return data;
  }
}
