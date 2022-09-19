class Bethapi {
  String? _sectionName;
  List<EntryContent>? _sectionContent;

  Bethapi({String? sectionName, List<EntryContent>? sectionContent}) {
    _sectionName = sectionName;
    _sectionContent = sectionContent;
  }

  String? get sectionName => _sectionName;
  List<EntryContent>? get sectionContent => _sectionContent;

  Bethapi.fromJson(Map<String, dynamic> json) {
    _sectionName = json['section_name'];
    _sectionContent = <EntryContent>[];
    json['section_content'].forEach((v) {
      _sectionContent!.add(EntryContent.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['section_name'] = _sectionName;
    data['section_content'] = _sectionContent!.map((v) => v.toJson()).toList();
    return data;
  }

  @override
  String toString() =>
      'Body(_sectionName: $_sectionName, _sectionContent: $_sectionContent)';
}

class EntryContent {
  String? _title;
  List<String>? _headerImages;
  String? _previewImage;
  List<Link>? _link;
  BethGeoLocation? _geoLocation;
  String? _markdown;

  EntryContent({
    String? title,
    List<String>? headerImages,
    String? previewImage,
    List<Link>? link,
    BethGeoLocation? geoLocation,
    String? markdown,
  }) {
    _title = title;
    _headerImages = headerImages;
    _previewImage = previewImage;
    _link = link;
    _geoLocation = geoLocation;
    _markdown = markdown;
  }

  String? get title => _title;
  List<String>? get headerImages => _headerImages;
  String? get previewImage => _previewImage;
  List<Link>? get links => _link;
  BethGeoLocation? get geoLocation => _geoLocation;
  String? get markdown => _markdown;

  EntryContent.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _headerImages = json['header_images'].cast<String>();
    _previewImage = json['preview_image'];
    _link = <Link>[];
    json['link'].forEach((v) {
      _link!.add(Link.fromJson(v));
    });
    _geoLocation = BethGeoLocation.fromJson(json['geo_location']);
    _markdown = json['markdown'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = _title;
    data['header_images'] = _headerImages;
    data['preview_image'] = _previewImage;
    data['link'] = _link!.map((v) => v.toJson()).toList();
    data['geo_location'] = _geoLocation!.toJson();
    data['markdown'] = _markdown;
    return data;
  }

  @override
  String toString() {
    return 'SectionContent(_title: $_title, _headerImages: $_headerImages, _previewImage: $_previewImage, _link: $_link, _geoLocation: $_geoLocation, _markdown: $_markdown)';
  }
}

class Link {
  String? _url;
  String? _linkName;

  Link({String? url, String? linkName}) {
    _url = url;
    _linkName = linkName;
  }

  String? get url => _url;
  String? get linkName => _linkName;

  Link.fromJson(Map<String, dynamic> json) {
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

class BethGeoLocation {
  double? _latitude;
  double? _longtitude;

  BethGeoLocation({double? latitude, double? longtitude}) {
    _latitude = latitude;
    _longtitude = longtitude;
  }

  double? get latitude => _latitude;
  double? get longitude => _longtitude;

  BethGeoLocation.fromJson(Map<String, dynamic> json) {
    _latitude = json['latitude'];
    _longtitude = json['longtitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = _latitude;
    data['longtitude'] = _longtitude;
    return data;
  }

  @override
  String toString() =>
      'GeoLocation(_latitude: $_latitude, _longtitude: $_longtitude)';
}
