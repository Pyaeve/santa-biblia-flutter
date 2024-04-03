// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api, file_names
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:santa_biblia/components/MenuBottomNavigationBar.dart';
import '../helpers/DatabaseService.dart';
import '../models/Verses.dart';

class VersesPage extends StatefulWidget {
  const VersesPage(
      {super.key,
      required this.book_id,
      required this.book_name,
      required this.book_chapter});
  final int book_id;
  final String book_name;
  final int book_chapter;
  @override
  _VersesPageState createState() => _VersesPageState();
}

class _VersesPageState extends State<VersesPage> {
  final DatabaseService _databaseService = DatabaseService();
  static final List<Verses> _verses = [];

  @override
  initState() {
    super.initState();
  }

  Future<List<Verses>> getVersesByBookAndChapter() async {
    final verses =
        await _databaseService.getVerses(widget.book_id, widget.book_chapter);
    _verses.clear();
    // ignore: prefer_is_empty
    if (_verses.length == 0) {
      _verses.addAll(verses);
    }
    print(_verses.toList());
    return _verses;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 3, 23, 112),
        title: const Text('La Santa Biblia'),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text('${widget.book_name}, Capitulo ${widget.book_chapter}',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          FutureBuilder<List<Verses>>(
            future: getVersesByBookAndChapter(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                              leading: Text(
                                snapshot.data![index].verse.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              title: Text(snapshot.data![index].text),
                              trailing:  InkWell(
                                onTap: () async {
                                 FlutterTts flutterTts = FlutterTts();
                                  flutterTts.speak(snapshot.data![index].text);

                                },
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Color.fromARGB(255, 1, 33, 88),
                                ),
                              )),
                         const Divider()
                        ],
                      );
                    });
              } else if (snapshot.hasError) {
                return const Text("Ocurrio un Eror");
              }
              return const Text("Cargando...");
            },
          ),
        
        ],
      )),
      bottomNavigationBar: const MenuBottomNavigationBar(item: 0),
    );
  }
}
