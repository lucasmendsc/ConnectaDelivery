import 'package:aqueduct/aqueduct.dart';
import 'package:connecta_delivery/models/Usuario.dart';

import '../connecta_delivery.dart';

class UserController extends ResourceController {
  UserController(this.context) {
    acceptedContentTypes = [ContentType.json];
  }

  final ManagedContext context;

  @Operation.post()
  Future<Response> postUsuario() async {
    final body = Usuario()..read(await request.body.decode(), ignore: ["id"]);

    final query = Query<Usuario>(context);
    query.values.login = body.login;
    query.values.senha = body.senha;
    query.values.nome = body.nome;

    final user = await query.insert();
    return Response.ok("Usuário criado com sucesso");
  }
}