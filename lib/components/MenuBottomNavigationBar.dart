// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:santa_biblia/pages/BooksPage.dart';


//Componente Menu de NAvegacion q
class MenuBottomNavigationBar extends StatefulWidget {
  const MenuBottomNavigationBar({super.key, required this.item});
  final int item;
  @override
  // ignore: library_private_types_in_public_api
  _MenuBottomNavigationBarState createState() =>
      _MenuBottomNavigationBarState();
}

class _MenuBottomNavigationBarState extends State<MenuBottomNavigationBar> {
  int selecteditem = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  void _onItemTapped(int index) {
   
    setState(() {
      selecteditem = index;
    });

   
    switch (selecteditem) {
      case 0:
        if(selecteditem!=widget.item){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BooksPage(title: 'La Santa Biblia')),
          );
          break;
        }
        break;
       case 1:
        if(selecteditem!=widget.item){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  const BooksPage(title: 'Categorias')),
          );
          break;
        
      
      }
      break;
    
    }

    
  }


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor:const Color.fromARGB(255, 60, 60, 159),// Colors.white,
      selectedItemColor:Color.fromARGB(255, 250, 250, 250), // Colors.black,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      unselectedItemColor: Color.fromARGB(255, 129, 144, 167),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      enableFeedback: true,
      currentIndex: widget.item,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.house),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Buscar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.handyman_rounded),
          label: 'Preferencias',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.info),
          label: 'Info',
        ),
      ],
    );
  }
}
