import 'package:connecta_delivery/models/Cliente.dart';

import '../connecta_delivery.dart';

class Usuario extends ManagedObject<_usuario> implements _usuario {}

class _usuario {
  @primaryKey
  int id;

  @Column(nullable: false)
  String nome;

  @Column(unique: true)
  String login;

  @Column(omitByDefault: true)
  String senha;

  String passwordHash;

  @Column(nullable: false)
  Cliente _cliente;
}