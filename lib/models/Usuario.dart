import '../connecta_delivery.dart';

class Usuario extends ManagedObject<_usuario> implements _usuario {}

class _usuario {
  @primaryKey
  int id;

  @Column(unique: true)
  String name;

  @Column(unique: true)
  String email;

  @Column(omitByDefault: true)
  String senha;


}