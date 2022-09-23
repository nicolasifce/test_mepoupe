import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CepsDb {
  late SharedPreferences _prefes;
  CepsDb() {
    _initShared();
  }

  _initShared() async {
    _prefes = await SharedPreferences.getInstance();
  }

  Future<int> getCepsNumbers() async {
    try {
      final int? items = _prefes.getInt('ceps');
      if (items != null) return items;
      return 0;
    } catch (e) {
      debugPrint(e.toString());
      throw ("Não foi possivel acessar os ceps");
    }
  }

  Future<String> addCepsNumber() async {
    try {
      final itensActual = await getCepsNumbers();
      final itemAdd = itensActual + 1;
      _prefes.setInt('ceps', itemAdd);
      return 'Cep salvo com sucesso';
    } catch (e) {
      throw ("Não foi possivel salvar o cep");
    }
  }
}
