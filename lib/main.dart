import 'package:flutter/material.dart';
import 'pages/BooksPage.dart';

void main() {
    
    WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La Santa Biblia',
      theme: ThemeData(
          visualDensity: VisualDensity.standard,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                if (states.contains(WidgetState.focused)) return Colors.indigo;
                return null;
              }),
              shadowColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                if (states.contains(WidgetState.focused)) return const Color.fromARGB(255, 144, 158, 234);
                return null;
              }),
            ),
          ),
          primaryColor: Color.fromARGB(255, 94, 107, 194),
        
          primaryColorLight: Colors.indigo,
          canvasColor: const Color(0xffffffff),
          splashColor: Color.fromARGB(105, 197, 203, 235),
          useMaterial3: true),
      home: const BooksPage(title: 'La Santa Biblia'),
      debugShowCheckedModeBanner: false,
    );
  }
}
