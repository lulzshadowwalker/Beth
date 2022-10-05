class BethLink {
  String? _url;
  String? _linkName;

  BethLink({String? url, String? linkName}) {
    _url = url;
    _linkName = linkName;
  }

  String? get url => _url;
  String? get linkName => _linkName;

  BethLink.fromJson(Map<String, dynamic> json) {
    _url = json['url'];
    _linkName = json['link_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = _url;
    data['link_name'] = _linkName;
    return data;
  }

  @override
  String toString() => 'Link(_url: $_url, _linkName: $_linkName)';
}
