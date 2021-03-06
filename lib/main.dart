import 'package:flutter/material.dart';
import 'package:flutter_pizza_4/model/variables.dart';
import 'package:flutter_pizza_4/page/main_detalle.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String nombre = '';
  String apellido = '';
  String telefono = '';
  @override
  void initState() {
    super.initState();
  }

  deactiv() {
    controlerNombre.text = '';
    controlerApellido.text = '';
    controlerTelefono.text = '';
    _radioValor = 0;
    for (var f in checkboxs) {
      f.valores = false;
    }
  }

  List<String> chekers = [];
  List size = [];
  int _radioValor = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La Parmesana',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('La Parmesana'),
        ),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Column(
              children: [
                const Divider(),
                widgetText('FORMULARIO'),
                ...formulario.map((e) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            margin: const EdgeInsets.all(8),
                            elevation: 2,
                            child: TextFormField(
                              keyboardType: (e.titulo=='Telefono')?TextInputType.phone:TextInputType.text,
                              decoration: InputDecoration(
                                labelText: e.titulo,
                                hintText: e.titulo,
                                isDense: true,
                              ),
                              controller: e.textEditingController,
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }).toList(),
                const Divider(),
                widgetText('INGREDIENTES'),
                ...checkboxs.map((e) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 50,
                        child: CheckboxListTile(
                            title: Text(e.titulo),
                            selected: e.valores,
                            value: e.valores,
                            onChanged: (value) {
                              setState(() {
                                e.valores = value!;
                                if (value) {
                                  chekers.add(e.titulo);
                                } else {
                                  chekers.remove(e.titulo);
                                }
                              });
                            }),
                      ),
                    ],
                  );
                }).toList(),
                widgetText('TAMA??O DE LA PIZZA'),
                Row(children: [
                  ...sizePizza
                      .map(
                        (e) => SizedBox(
                          width: 110,
                          child: RadioListTile<int>(
                            value: e.pos,
                            groupValue: _radioValor,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  _radioValor = value;
                                }
                              });
                            },
                            title: Text(e.size),
                          ),
                        ),
                      )
                      .toList(),
                ]),
                const Text('P: Peque??a M: Mediana G: Grande U: Ultra'),
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    //color: Colors.cyan,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        'http://parmesanapizza.pyplabs.com/wp-content/uploads/sites/71/2020/02/parmesana_logoretina1.png',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (chekers.isNotEmpty) {
              if (controlerNombre.text != '' &&
                  controlerApellido.text != '' &&
                  controlerTelefono.text != '') {
                setState(() {
                  nombre = controlerNombre.text;
                  apellido = controlerApellido.text;
                  telefono = controlerTelefono.text;
                  deactiv();
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyDetalle(
                            chekersIngredient: chekers,
                            size: _radioValor,
                            controlerNombre: nombre,
                            controlerApellido: apellido,
                            controlerTelefono: telefono,
                          )),
                );
              } else {
                toast(v: 'Debe llenar todos los campos');
              }
            } else {
              toast(v: 'Debe seleccionar al menos 1 ingrediente');
            }
          },
          child: const Icon(Icons.save),
        ),
      ),
    );
  }

  toast({required String v}) {
    return Fluttertoast.showToast(
        msg: v,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Text widgetText(valor) => Text(
        '$valor',
        style: const TextStyle(fontSize: 24),
      );
}
