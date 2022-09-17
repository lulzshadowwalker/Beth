/// data model for recieving the response from the EVA api. ( https://eva.pingutil.com )
class Eva {
  String? _status;
  Data? _data;

  Eva({String? status, Data? data}) {
    if (status != null) {
      _status = status;
    }
    if (data != null) {
      _data = data;
    }
  }

  String? get status => _status;
  Data? get data => _data;

  Eva.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = _status;
    data['data'] = _data!.toJson();
    return data;
  }
}

class Data {
  String? _emailAddress;
  String? _domain;
  bool? _validSyntax;
  bool? _disposable;
  bool? _webmail;
  bool? _deliverable;
  bool? _catchAll;
  bool? _gibberish;
  bool? _spam;

  Data({
    String? emailAddress,
    String? domain,
    bool? validSyntax,
    bool? disposable,
    bool? webmail,
    bool? deliverable,
    bool? catchAll,
    bool? gibberish,
    bool? spam,
  }) {
    _emailAddress = emailAddress;
    _domain = domain;
    _validSyntax = validSyntax;
    _disposable = disposable;
    _webmail = webmail;
    _deliverable = deliverable;
    _catchAll = catchAll;
    _gibberish = gibberish;
    _spam = spam;
  }

  String? get emailAddress => _emailAddress;
  String? get domain => _domain;
  bool? get validSyntax => _validSyntax;
  bool? get disposable => _disposable;
  bool? get webmail => _webmail;
  bool? get deliverable => _deliverable;
  bool? get catchAll => _catchAll;
  bool? get gibberish => _gibberish;
  bool? get spam => _spam;

  Data.fromJson(Map<String, dynamic> json) {
    _emailAddress = json['email_address'];
    _domain = json['domain'];
    _validSyntax = json['valid_syntax'];
    _disposable = json['disposable'];
    _webmail = json['webmail'];
    _deliverable = json['deliverable'];
    _catchAll = json['catch_all'];
    _gibberish = json['gibberish'];
    _spam = json['spam'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['email_address'] = _emailAddress;
    data['domain'] = _domain;
    data['valid_syntax'] = _validSyntax;
    data['disposable'] = _disposable;
    data['webmail'] = _webmail;
    data['deliverable'] = _deliverable;
    data['catch_all'] = _catchAll;
    data['gibberish'] = _gibberish;
    data['spam'] = _spam;
    return data;
  }
}
