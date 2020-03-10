import '../connecta_delivery.dart';

class Produto extends ManagedObject<_produto> implements _produto {}

class _produto {
  @primaryKey
  int id;

  @Column(unique: true)
  String nome;

  @Column()
  String lote;

  @Column(nullable: false)
  int qunatidade;

  @Column(nullable: false)
  double preco;

}