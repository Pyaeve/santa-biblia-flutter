// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

import '../components/MenuBottomNavigationBar.dart';
import '../helpers/DatabaseService.dart';
import '../models/Chapters.dart';
import 'VersesPage.dart';

class ChapterPage extends StatefulWidget {
  const ChapterPage(
      {super.key, required this.book_id, required this.book_name});
  final int book_id;
  final String book_name;
  @override
  _ChapterPageState createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  final DatabaseService _databaseService = DatabaseService();
  static final List<Chapters> _chapters = [];
  InitState() {
    super.initState();
  }

  Future<List<Chapters>> getChaptersByBook() async {
    final chapters = await _databaseService.getChapters(widget.book_id);
    _chapters.clear();
    if (_chapters.isEmpty) {
      _chapters.addAll(chapters);
    }
    print(_chapters.toList());
    return _chapters;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 3, 23, 112),
        title: Text('capitulos de ${widget.book_name}'),
      ),
      body: FutureBuilder<List<Chapters>>(
        future: getChaptersByBook(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return Center(
                      child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VersesPage(
                                  book_id: snapshot.data![index].book,
                                  book_name: widget.book_name,
                                  book_chapter: snapshot.data![index].chapter,
                                )),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.menu_book,
                          size: 48,
                        ),
                        Text("${snapshot.data?[index].chapter}"),
                      ],
                    ),
                  ));
                });
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error"));
          }
          return const Center(child: Text("Loading..."));
        },
      ),
      bottomNavigationBar: const MenuBottomNavigationBar(item: 0),
    );
  }
}
