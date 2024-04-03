// ignore_for_file: file_names

import 'dart:convert';

class Verses {
  final int book;
  final int chapter;
  final int  verse;
  final String  text;
 
  Verses({
    required this.book,
     required this.chapter,
      required this.verse,
       required this.text,
});
 Map<String, dynamic> toMap() {
    return {
      'book': book,
      'chapter': chapter,
      'verse': verse,
      'text': text,
    
    };
  }

  factory Verses.fromMap(Map<String, dynamic> map) {
    return Verses(
      book: map['book'],
      chapter: map['chapter'],
      verse: map['verse'] ,
      text: map['text'],
    
    );
  }

  String toJson() => json.encode(toMap());

  factory Verses.fromJson(String source) => Verses.fromMap(json.decode(source));

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Verses(book: $book, chapter: $chapter, verse: $verse, text: $text)';
  }


}