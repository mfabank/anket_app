import 'package:flutter/material.dart';
import 'package:polls/polls.dart';

class Anket extends StatefulWidget {
  @override
  _AnketState createState() => _AnketState();
}

class _AnketState extends State<Anket> {
  double secenek1 = 1;
  double secenek2 = 2;
  double secenek3 = 1;
  double secenek4 = 3;

  Map oyKullananlar = {
    'Muhammed Fatih AKTAŞ': 1,
    'Mustafa Furkan AKTAŞ': 3,
    'Ali Osman YILMAZ': 2,
    'Cevher GÜZELGÖZ': 1
  };

  String girisYapanKullanici = 'Muhammed Fatih AKTAŞ';

  String anketiOlusturanKisi = 'Admin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anket"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Polls(
              children: [
                Polls.options(title: 'Youtube', value: secenek1),
                Polls.options(title: 'İnstagram', value: secenek2),
                Polls.options(title: 'Facebook', value: secenek3),
                Polls.options(title: 'Linkedin', value: secenek4),
              ],
              question: Text(
                "Hangisinde daha fazla zaman geçiriyorsunuz ?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              voteData: oyKullananlar,
              currentUser: girisYapanKullanici,
              creatorID: anketiOlusturanKisi,
              userChoice: oyKullananlar[girisYapanKullanici],
              onVote: (secim) {
                setState(() {
                  oyKullananlar[girisYapanKullanici] = secim;
                });

                if (secim == 1) {
                  setState(() {
                    secenek1 += 1;
                  });
                } else if (secim == 2) {
                  setState(() {
                    secenek2 += 1;
                  });
                } else if (secim == 3) {
                  setState(() {
                    secenek3 += 1;
                  });
                } else if (secim == 4) {
                  setState(() {
                    secenek4 += 1;
                  });
                }
              },
              onVoteBackgroundColor: Colors.deepOrangeAccent,
            ),
          ],
        ),
      ),
    );
  }
}
