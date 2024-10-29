import 'dart:ui_web';

import 'package:flutter/material.dart';

class FilmDetay extends StatefulWidget {
  var film;
  FilmDetay({this.film});

  @override
  State<FilmDetay> createState() => _FilmDetayState();
}

class _FilmDetayState extends State<FilmDetay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.film.film_adi),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(78, 255, 86, 34),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/images/${widget.film.film_resim_adi}"),
            Text(
              "${widget.film.film_fiyat}\u{20BA}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  print("${widget.film.film_adi} sepete eklendi");
                },
                child: Text(
                  "Kirala",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
