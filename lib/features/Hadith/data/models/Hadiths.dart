import '../../../quran/data/models/data.dart';
import 'links.dart';

class Hadiths {
  final int currentPage;
  final List<Data> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
 final List<Links> links;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int to;
  final int total;

  Hadiths({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory Hadiths.fromJson(Map<String, dynamic> json) {
    return Hadiths(
      currentPage: json['current_page'],
      data: (json['data'] as List<dynamic>).map((v) => Data.fromJson(v)).toList(),
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      links: (json['links'] as List<dynamic>).map((v) => Links.fromJson(v)).toList(),
      nextPageUrl: json['next_page_url']?.isNotEmpty == true ? json['next_page_url'] : " ",
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url']?.isNotEmpty == true ? json['prev_page_url'] : " ",
      to: json['to'],
      total: json['total'],
    );
  }


}
