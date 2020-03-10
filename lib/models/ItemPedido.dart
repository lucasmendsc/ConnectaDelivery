import '../connecta_delivery.dart';
import 'Produto.dart';

class ItemPedido extends ManagedObject<_itemPedido> implements _itemPedido {}

class _itemPedido {
  @primaryKey
  int id;

  @Column(nullable: false)
  Produto _produto;

  @Column(nullable: false)
  int quantidade;

  @Column(nullable: false)
  double subTotal;

}