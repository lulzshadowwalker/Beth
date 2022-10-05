import 'package:beth/models/beth_link.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'beth_geo_location.dart';

class EntryContent {
  String? _title;
  List<String>? _headerImages;
  String? _previewImage;
  List<BethLink>? _link;
  BethGeoLocation? _geoLocation;
  String? _markdown;

  EntryContent({
    String? title,
    List<String>? headerImages,
    String? previewImage,
    List<BethLink>? link,
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
  List<BethLink>? get links => _link;
  BethGeoLocation? get geoLocation => _geoLocation;
  String? get markdown => _markdown;

  EntryContent.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snap) {
    _title = snap.data()?['title'];
    _headerImages = snap.data()?['header_images'].cast<String>();
    _previewImage = snap.data()?['preview_image'];
    _link = <BethLink>[];
    snap.data()?['link'].forEach((v) {
      _link!.add(BethLink.fromJson(v));
    });
    _geoLocation = BethGeoLocation.fromJson(snap.data()?['geo_location']);
    _markdown = snap.data()?['markdown'];
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
