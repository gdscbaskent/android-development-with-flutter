import 'package:flutter/material.dart';
import 'ders.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GDSC - Etkinlik Sayacı',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

  List<Ders> dersler = [];

  void dersEklePopup() {
    var dersController = TextEditingController();

    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Ders Ekle"),
        content: SingleChildScrollView(
          child:
            TextField(
              controller: dersController,
              decoration: const InputDecoration(
                labelText: "Ders Kodu Giriniz",
              ),
            )
          ),
          actions: [
            ElevatedButton(
              child: const Text("Ders Ekle"),
              onPressed: () {
                dersler.add(Ders(dersKodu: dersController.text, devamsizlik: 0));
                dersController.clear();
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
        title: const Text("Devamsızlık Takip Uygulaması"),
      ),

      body: ListView.builder(
        itemCount: dersler.length,
        itemBuilder: (context, index) {
          Ders ders = dersler[index];
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  ders.dersKodu,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                Text(ders.devamsizlik.toString()),

                ElevatedButton(
                  child: const Icon(Icons.add),
                  onPressed: (){
                   setState(() => ders.devamsizlikEkle());
                  },
                ),

                ElevatedButton(
                  child: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() => ders.devamsizlikSil());
                  },
                ),

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
                      setState(() => dersler.removeAt(index));
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
        onPressed: () => dersEklePopup(),
      ),
    );
  }
}