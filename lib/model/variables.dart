import 'package:flutter/material.dart';

class Formulario {
  String titulo;
  TextEditingController textEditingController;
  Formulario({required this.titulo, required this.textEditingController});
}

TextEditingController controlerNombre = TextEditingController();
TextEditingController controlerApellido = TextEditingController();
TextEditingController controlerTelefono = TextEditingController();

final formulario = [
  Formulario(titulo: 'Nombres', textEditingController: controlerNombre),
  Formulario(titulo: 'Apellidos', textEditingController: controlerApellido),
  Formulario(titulo: 'Telefono', textEditingController: controlerTelefono),
];

class Checksbox {
  String titulo;
  bool valores;
  Checksbox({required this.titulo, required this.valores});
}

List<Checksbox> checkboxs = [
  Checksbox(titulo: 'Piña', valores: false),
  Checksbox(titulo: 'Champiñones', valores: false),
  Checksbox(titulo: 'Oregano', valores: false),
  Checksbox(titulo: 'Pollo', valores: false),
];

class SizePizza {
  String size;
  int pos;
  SizePizza({required this.pos, required this.size});
}

final sizePizza = [
  SizePizza(size: 'P', pos: 0),
  SizePizza(size: 'M', pos: 1),
  SizePizza(size: 'G', pos: 2),
  SizePizza(size: 'U', pos: 3),
];
