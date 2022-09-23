import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/cep.model.dart';

class FavoritesDb {
  late SharedPreferences _prefes;
  FavoritesDb() {
    _initShared();
  }

  _initShared() async {
    _prefes = await SharedPreferences.getInstance();
  }

  Future<List<CepModel>> getListFavorites() async {
    try {
      List<CepModel> listCep = [];
      final List<String>? items = _prefes.getStringList('favorites');
      if (items != null) {
        for (var element in items) {
          listCep.add(CepModel.fromJson(jsonDecode(element)));
        }
      }
      return listCep;
    } catch (e) {
      throw ("Não foi possivel acessar a lista de favoritos");
    }
  }

  Future<String> setListFavorites({required CepModel cep}) async {
    try {
      List<CepModel> listCep = [];
      List<String> listShared = [];
      final list = await getListFavorites();
      if (list.isNotEmpty) listCep.addAll(list);
      listCep.add(cep);
      for (var element in listCep) {
        listShared.add(jsonEncode(element.toJson()));
      }
      _prefes.setStringList('favorites', listShared);

      return 'Endereço adicionado com sucesso';
    } catch (e) {
      throw ("Não foi possivel adicionar a lista de favoritos");
    }
  }

  Future<String> removeListFavorites({required int index}) async {
    try {
      List<CepModel> listCep = [];
      List<String> listShared = [];
      final list = await getListFavorites();
      if (list.isNotEmpty) listCep.addAll(list);
      listCep.removeAt(index);
      for (var element in listCep) {
        listShared.add(jsonEncode(element.toJson()));
      }
      _prefes.setStringList('favorites', listShared);

      return 'Endereço removido com sucesso';
    } catch (e) {
      throw ("Não foi possivel remover o endereço");
    }
  }
}
