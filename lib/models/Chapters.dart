// ignore_for_file: file_names

import 'dart:convert';

class Chapters {
 final int chapter;
 final int book;
 Chapters({
  required this.chapter,
  required this.book
 });
 Map<String, dynamic> toMap() {
    return {
      'book': book,
      'chapter': chapter,
     
    
    };
  }

  factory Chapters.fromMap(Map<String, dynamic> map) {
    return Chapters(
      book: map['book'],
      chapter: map['chapter'],
    
    
    );
  }

  String toJson() => json.encode(toMap());

  factory Chapters.fromJson(String source) => Chapters.fromMap(json.decode(source));

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Chapters(Chapter: $chapter, book: $book)';
  }
}
