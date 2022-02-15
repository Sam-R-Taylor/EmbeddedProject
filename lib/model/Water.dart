class Aqua {
  final String title;
  final String description;

  Aqua({this.title, this.description});

  factory Aqua.fromJson(Map<String, dynamic> json) {
    return Aqua(title: json['ename'], description: json['eemail']);
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
      };
}
