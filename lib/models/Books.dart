import 'dart:convert';

class Books {

  final int id;
  final String name;
  final String  abreviation;
  final String  testament;
  final String  genre;

  Books({
    required this.id,
    required this.name,
    required this.abreviation,
    required this.testament,
    required this.genre,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'abreviation': abreviation,
      'testament': testament,
      'genre': genre,
    };
  }

  factory Books.fromMap(Map<String, dynamic> map) {
    return Books(
      id: map['id']?.toInt() ?? 0,
      name: map['name'],
      abreviation: map['abreviation'] ,
      testament: map['testament'],
      genre: map['genre']?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Books.fromJson(String source) => Books.fromMap(json.decode(source));

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Books(id: $id, name: $name, abreviation: $abreviation, testament: $testament, genre: $genre)';
  }


}