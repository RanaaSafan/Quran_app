import 'package:quran_app/features/Home/data/models/params.dart';

import 'location.dart';

class Method {
  final int? id;
  final String? name;
  final Params? params;
  final Location? location;

  Method({
    required this.id,
    required this.name,
    required this.params,
    required this.location,
  });

  factory Method.fromJson(Map<String, dynamic> json) {
    return Method(
      id: json['id'] as int? ,
      name: json['name']as String?,
      params:
      json['params'] != null ? Params.fromJson(json['params']) : null,
      location: json['location'] != null ? Location.fromJson(json['location']) : null,
    );
  }
}
