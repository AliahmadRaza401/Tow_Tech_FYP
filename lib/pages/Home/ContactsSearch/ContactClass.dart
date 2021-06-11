class ContactClass {
  final int id;
  final String name;
  final String place;
  final String number;

  const ContactClass({
    this.id,
    this.name,
    this.number,
    this.place,
  });

  factory ContactClass.fromJson(Map<String, dynamic> json) => ContactClass(
        id: json['id'],
        name: json['name'],
        place: json['place'],
        number: json['number'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'place': place,
        'number': number,
      };
}
