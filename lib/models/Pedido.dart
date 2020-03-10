import 'package:connecta_delivery/models/ItemPedido.dart';

import '../connecta_delivery.dart';
import 'Cliente.dart';

class Pedido extends ManagedObject<_pedido> implements _pedido {}

class _pedido {
  @primaryKey
  int id;

  @Column(nullable: false)
  DateTime dataPedido;

  @Column(nullable: false)
  Cliente _cliente;

  ManagedSet<ItemPedido> itensPedido;

}