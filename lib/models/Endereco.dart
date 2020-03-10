
import '../connecta_delivery.dart';

class Endereco extends ManagedObject<_endereco> implements _endereco {}

class _endereco {
  @primaryKey
  int id;

  @Column()
  String cidade;

  @Column(nullable: false)
  String logradouro;

  @Column()
  int numero;
  
}