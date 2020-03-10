import '../connecta_delivery.dart';

class Produto extends ManagedObject<_produto> implements _produto {}

class _produto {
  @primaryKey
  int id;

  @Column(nullable: false)
  String nome;

  @Column()
  String descricao;

  @Column(nullable: false)
  double valor;

  @Column()
  String foto;

}