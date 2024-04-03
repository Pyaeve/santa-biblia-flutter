// ignore_for_file: use_super_parameters, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:santa_biblia/components/MenuBottomNavigationBar.dart';
import 'ChaptersPage.dart';
import '../helpers/DatabaseService.dart';
import '../models/Books.dart';


class BooksPage extends StatefulWidget {
  const BooksPage({super.key, required this.title});
  final String title;
  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  final int tabItemSelect = 0;

  final DatabaseService _databaseService = DatabaseService();
  static final List<Books> _booksold = [];
  static final List<Books> _booksnew = [];

  @override
  initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();

    //_databaseService.insertRecords();
  }

  Future<List<Books>> getBooksOlds() async {
    final books = await _databaseService.getBooksOld();
    if (_booksold.isEmpty) {
      _booksold.addAll(books);
    }

    return _booksold;
  }

  Future<List<Books>> getBooksNews() async {
    final books = await _databaseService.getBooksNew();
    if (_booksnew.isEmpty) _booksnew.addAll(books);

    return _booksnew;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: tabItemSelect,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const  Color.fromARGB(255, 3, 23, 112),
          title: Text(widget.title, style: const TextStyle(color: Colors.grey)),
          centerTitle: true,
          bottom: TabBar(
            tabAlignment: TabAlignment.center,
            isScrollable: true,
            labelStyle: Theme.of(context).tabBarTheme.labelStyle,
            unselectedLabelStyle:
                Theme.of(context).tabBarTheme.unselectedLabelStyle,
            labelColor:  Colors.white,
            unselectedLabelColor:
               Color.fromARGB(255, 162, 162, 189),
            indicatorColor: const Color.fromARGB(255, 39, 88, 238),
           
            padding: const EdgeInsets.all(0),
            tabs: const [
              Tab(
                text: "Antiguo Testamento",
              ),
              Tab(
                text: "Nuevo Testamento",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: FutureBuilder<List<Books>>(
                future: getBooksOlds(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                        itemCount: snapshot.data?.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          return Center(
                              child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChapterPage(
                                          book_id: snapshot.data![index].id,
                                          book_name: snapshot.data![index].name,
                                        )),
                              );
                             
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.menu_book, size: 48),
                                Text("${snapshot.data?[index].name}"),
                              ],
                            ),
                          ));
                        });
                  } else if (snapshot.hasError) {
                    return const Text("Error");
                  }
                  return const Text("Loading...");
                },
              ),
            ),
            Center(
              child: FutureBuilder<List<Books>>(
                future: getBooksNews(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                        itemCount: snapshot.data?.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          return Center(
                              child: InkWell(
                            onTap: () {
                               Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChapterPage(
                                          book_id: snapshot.data![index].id,
                                          book_name: snapshot.data![index].name,
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
                                Text("${snapshot.data?[index].name}"),
                              ],
                            ),
                          ));
                        });
                  } else if (snapshot.hasError) {
                    return const Text("Error");
                  }
                  return const Text("Loading...");
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: const MenuBottomNavigationBar(item: 0),
      ),
    );
  }
}
