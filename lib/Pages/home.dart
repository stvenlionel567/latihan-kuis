import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../dummy_menu.dart';

class Beranda extends StatefulWidget {
  final username;

  const Beranda({super.key, required this.username});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Text(
            "Hi, Hello Bonjour ${widget.username}",
            style: GoogleFonts.poppins(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Logout"))
          ],
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: const Color.fromARGB(255, 8, 25, 34),
        body: Container(
          child: ListView.builder(
            itemCount: foodMenuList.length,
            itemBuilder: (context, index) {
              final foodMenu = foodMenuList[index];
              return Card(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: ListTile(
                    leading: foodMenu.imageUrls.isNotEmpty
                        ? Image.network(
                            foodMenu.imageUrls[0],
                            width: 50,
                            height: 50,
                          )
                        : Container(
                            child: Icon(Icons.image),
                            width: 50,
                            height: 50,
                          ),
                    title: Text(foodMenu.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(foodMenu.description),
                        Text(foodMenu.ingredients)
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Menu List'),
    //   ),
    //   body: ListView.builder(
    //     itemCount: foodMenuList.length,
    //     itemBuilder: (context, index) {
    //       final foodMenu = foodMenuList[index];
    //       return Card(
    //         margin: EdgeInsets.all(10.0),
    //         elevation: 5,
    //         child: ListTile(
    //           leading: foodMenu.imageUrls.isNotEmpty
    //               ? Image.network(
    //                   foodMenu.imageUrls[0],
    //                   fit: BoxFit.cover,
    //                   width: 50,
    //                   height: 50,
    //                 )
    //               : Container(
    //                   width: 50,
    //                   height: 50,
    //                   color: Colors.grey,
    //                   child: Icon(Icons.image),
    //                 ),
    //           title: Text(foodMenu.name),
    //           subtitle: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(foodMenu.category),
    //               Text(foodMenu.description),
    //               Text('Ingredients: ${foodMenu.ingredients}'),
    //               Text('Cooking Time: ${foodMenu.cookingTime}'),
    //             ],
    //           ),
    //           trailing: Text(foodMenu.price),
    //         ),
    //       );
    //     },
    //   ),
    // );
