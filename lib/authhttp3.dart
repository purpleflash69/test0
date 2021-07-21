class authhttp3 {
  late bool success;
  late Data data;
  late String message;

  authhttp3({required this.success, required this.data, required this.message});

  authhttp3.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = (json['data'] != null ? new Data.fromJson(json['data']) : null)!;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['data'] = this.data.toJson();
    data['message'] = this.message;
    return data;
  }
}

class Data {
  late String customerId;

  Data({
    required this.customerId,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['customerId'] != null) {
      customerId = json['customerId'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;

    return data;
  }
}
