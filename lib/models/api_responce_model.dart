abstract class ApiDataModel {
  Map<String, dynamic> toJson();
}

class ApiResponce<T extends ApiDataModel> {
  String? message;
  int? statusCode;
  T? data;

  ApiResponce({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  ApiResponce.fromJson(Map<String, dynamic> json, T data) {
    message = json['message'];
    statusCode = json['statusCode'];
    this.data = data;
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "statusCode": statusCode,
      "data": data?.toJson(),
    };
  }
}
