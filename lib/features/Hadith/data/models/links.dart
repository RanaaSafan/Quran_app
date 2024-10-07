class Links {
  final String? url;    // يمكن أن تكون null
  final String? label;  // يمكن أن تكون null
  final bool active;

  Links({
    this.url,            // هذا الحقل ليس مطلوبًا
    this.label,          // هذا الحقل ليس مطلوبًا
    required this.active,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      url: json['url']?.isNotEmpty == true ? json['url'] : " ",  // يمكن أن تكون null
      label: json['label']?.isNotEmpty == true ? json['label'] : " ", // يمكن أن تكون null
      active: json['active'],
    );
  }


}