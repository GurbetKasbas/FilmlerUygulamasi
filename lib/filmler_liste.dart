import 'package:filmuygulamasi/filmler.dart';
import 'package:flutter/material.dart';

class FilmlerListesi extends StatefulWidget {
  const FilmlerListesi({super.key});

  @override
  State<FilmlerListesi> createState() => _FilmlerListesiState();
}

class _FilmlerListesiState extends State<FilmlerListesi> {
  Future<List<Filmler>> filmleriGetir() async {
    var filmListesi = <Filmler>[];

    var f1 = Filmler(1, "Anadoluda", "anadoluda.png", 109.99);
    var f2 = Filmler(1, "Django", "django.png", 99.99);
    var f3 = Filmler(1, "Inception", "inception.png", 89.99);
    var f4 = Filmler(1, "Interstellar", "interstellar.png", 119.99);
    var f5 = Filmler(1, "The Hateful Eight", "thehatefuleight.png", 109.99);
    var f6 = Filmler(1, "The Pianist", "thepianist.png", 129.99);

    filmListesi.add(f1);
    filmListesi.add(f2);
    filmListesi.add(f3);
    filmListesi.add(f4);
    filmListesi.add(f5);
    filmListesi.add(f6);

    return filmListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filmler"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(78, 255, 86, 34),
      ),
      body: FutureBuilder(
        future: filmleriGetir(), 
        builder: (context, snapshot){
          if(snapshot.hasData){
            //Data ile gonderilen listeyi aldık
            var filmListesi = snapshot.data;

            return GridView.builder(
              itemCount: filmListesi!.length,//Gösterilecek veri sayısı
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,//Satırdakı item sayısı
                childAspectRatio: 2/3.5,//Genişlik ve yukseklık
                
                ), 
              itemBuilder: (context, index) {
                //Once listedeki elemanları tek tek film değişkenine atadık
                var film = filmListesi[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: const Color.fromARGB(255, 230, 226, 226),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/images/${film.film_resim_adi}"),
                        Text("${film.film_adi} " , style:const  TextStyle(fontWeight: FontWeight.bold),),
                        Text("${film.film_fiyat}" , style:const TextStyle(fontWeight: FontWeight.bold , color: Colors.red),),
                      ],
                    ),
                  ),
                );
              },
              
              );
          }else{
            return Center();
          }
            
        }
        ),
    );
  }
}
