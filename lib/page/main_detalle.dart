// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyDetalle extends StatefulWidget {
  List<String> chekersIngredient;
  TextEditingController controlerNombre;
  TextEditingController controlerApellido;
  TextEditingController controlerTelefono;
  int size;
  MyDetalle(
      {required this.chekersIngredient,
      required this.size,
      required this.controlerNombre,
      required this.controlerApellido,
      required this.controlerTelefono,
      Key? key})
      : super(key: key);

  @override
  State<MyDetalle> createState() => _MyDetalleState();
}

class _MyDetalleState extends State<MyDetalle> {
  String body = '';
  String tamano = '';
  @override
  void initState() {
    super.initState();
    convertSize(valor: widget.size);
    body =
        'Cliente: ${widget.controlerNombre.text + ' ' + widget.controlerApellido.text}\nTelefono: ${widget.controlerTelefono.text}\nOrdeno: Un Pizza $tamano de ${widget.chekersIngredient.join(',')}';
  }

  convertSize({required int valor}) {
    switch (valor) {
      case 0:
        tamano = 'Pequeña';
        break;
      case 1:
        tamano = 'Mediana';
        break;
      case 2:
        tamano = 'Grande';
        break;
      case 3:
        tamano = 'Ultra';
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detalle compra',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Detalle'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            //color: Colors.cyan,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                'http://parmesanapizza.pyplabs.com/wp-content/uploads/sites/71/2020/02/parmesana_logoretina1.png',
              ),
            ),
          ),
          margin: const EdgeInsets.only(top: 6, left: 16, right: 16),
          child: Column(
            children: [
              Text(
                'Gracias por la Compra',
                style: styleT,
              ),
              Divider(),
              SizedBox(
                child: Text(
                  body,
                  style: styleT.copyWith(fontSize: 18),
                  maxLines: 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle styleT = const TextStyle(fontSize: 24);
}
