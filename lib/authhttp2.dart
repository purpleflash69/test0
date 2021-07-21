class authhttp2 {
  late bool success;
  late Data data;

  authhttp2({
    required this.success,
    required this.data,
  });

  authhttp2.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = (json['data'] != null ? new Data.fromJson(json['data']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }

    return data;
  }
}

class Data {
  late String customerId;
  late String name;
  late String email;

  Data({required this.customerId, required this.name, required this.email});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['customerId'] != null) {
      customerId = json['customerId'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['email'] != null) {
      email = json['email'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}
