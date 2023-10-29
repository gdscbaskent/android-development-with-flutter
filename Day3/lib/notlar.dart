import 'package:flutter/material.dart';
import 'not.dart';

class Notlar extends StatefulWidget {
  const Notlar({super.key});

  @override
  State<Notlar> createState() => _NotlarState();
}

class _NotlarState extends State<Notlar> {

  List<Not> notlar = [];

  void notEklePopUp() {
    var notController = TextEditingController();

    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Not Ekle"),
        content: SingleChildScrollView(
          child:
            TextField(
              controller: notController,
              decoration: const InputDecoration(
                labelText: "Not",
              ),
            )
          ),
          actions: [
            ElevatedButton(
              child: const Text("Not Ekle"),
              onPressed: () {
                notlar.add(Not(not: notController.text));
                notController.clear();
                Navigator.pop(context);
                setState(() {});
              },
            ),
            ElevatedButton(
              child: const Text("İptal"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      }
    );
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      appBar: AppBar(
        title: const Text("Notlarım"),
      ),

      body: ListView.builder(
        itemCount: notlar.length,
        itemBuilder: (context, index) {
          Not not = notlar[index];
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Text(not.getNot()),

                PopupMenuButton(
                  child: const Icon(Icons.arrow_drop_down),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 1,
                      child: Text(
                        "Sil",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                  onSelected: (menuItemValue){
                    if(menuItemValue == 1){
                      setState(() => notlar.removeAt(index));
                    }
                  },
                ),
              ],
            ),
          );
        }
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => notEklePopUp(),
      ),
    );
  }
}