import 'package:aqueduct/aqueduct.dart';
import 'package:connecta_delivery/models/Produto.dart';
import 'package:connecta_delivery/models/Usuario.dart';

class Entrega extends Serializable {
  int id;
  Usuario _usuario;
  List<Produto> _produtos;
  double precoTotal;
  DateTime dataPedido;

  @override
  Map<String, dynamic> asMap() {
    return {"id": id, "usuario": _usuario, "produto": _produtos
        ,"precoTotal" : precoTotal, "dataPedido" : dataPedido};
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    id = object["id"] as int;
    _usuario = object["usuario"] as Usuario;
    _produtos = object["produtos"] as List<Produto>;
    precoTotal = object["precoTotal"] as double;
    dataPedido = object["dataPedido"] as DateTime;
  }

  @Relate(#Entrega)
  Usuario _user;
}