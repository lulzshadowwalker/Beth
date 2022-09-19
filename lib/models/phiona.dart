class Phiona {
  bool? _success;
  int? _statusCode;
  List<Data>? _data;

  Phiona({
    bool? success,
    int? statusCode,
    List<Data>? data,
  }) {
    _success = success;
    _statusCode = statusCode;
    _data = data;
  }

  bool? get success => _success;
  int? get statusCode => _statusCode;
  List<Data>? get data => _data;

  Phiona.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _statusCode = json['status_code'];
    _data = <Data>[];
    json['data'].forEach((v) {
      _data!.add(Data.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = _success;
    data['status_code'] = _statusCode;
    data['data'] = _data!.map((v) => v.toJson()).toList();
    return data;
  }

  @override
  String toString() =>
      'Phiona(_success: $_success, _statusCode: $_statusCode, _data: $_data)';
}

class Data {
  String? _body;

  Data({String? body}) {
    _body = body;
  }

  String? get body => _body;

  Data.fromJson(Map<String, dynamic> json) {
    _body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['body'] = _body;
    return data;
  }
}
