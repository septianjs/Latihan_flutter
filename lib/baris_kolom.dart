import 'package:flutter/material.dart';

class BarisKolom extends StatelessWidget {
  const BarisKolom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Baris dan Kolom")),
      body: Column(
        children: List.generate(3, (baris) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(3, (kolom) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Baris ${baris + 1}, Kolom ${kolom + 1}"),
              );
            }),
          );
        }),
      ),
    );
  }
}
