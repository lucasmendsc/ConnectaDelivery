
import 'package:aqueduct/aqueduct.dart';
import 'package:connecta_delivery/models/Usuario.dart';

import '../Utils.dart';
import '../connecta_delivery.dart';

class SessionController extends ResourceController {
  SessionController(this.context) {
    acceptedContentTypes = [ContentType.json];
  }

  final ManagedContext context;

  @Operation.post()
  Future<Response> login() async {
    final body = Usuario()..read(await request.body.decode());

    final senha = body.senha;

    final query = Query<Usuario>(context)
      ..where((user) => user.login).like(body.login)
      ..where((user) => user.senha).like(senha.toString());
    final user = await query.fetchOne();

    if (user == null) {
      return Response.ok({"auth": false,"token": ""});
    }

    final jwt = Utils.generateJWT(user);

    return Response.ok({"auth": true, "token": jwt});
  }
}