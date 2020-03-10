import '../connecta_delivery.dart';

class Cliente extends ManagedObject<_cliente> implements _cliente {}

class _cliente {
  @primaryKey
  int id;

  @Column(nullable: false)
  String nome;

  @Column(nullable: false,unique: true)
  String cpf;

  @Column(unique: true)
  String rg;

  @Column(nullable: false)
  DateTime dataNascimento;

  @Column()
  String sexo;

  @Column(nullable: false)
  String telefone;

  @Column()
  String rua;

  @Column()
  int numero;

  @Column()
  String cidade;

}