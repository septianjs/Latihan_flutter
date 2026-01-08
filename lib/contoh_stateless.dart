import 'package:flutter/material.dart';

///class ContohStateless extends StatelessWidget {

  int counter=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contoh Stateless")),
      body: Column(
        children: [
          Text("Nomor : ${counter}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => counter++,
                child: Text("Tambah")
              ),
              ElevatedButton(
                onPressed: () => counter=0,
                child: Text("Reset")),
            ]),
        ]),
    );
  }
//}
