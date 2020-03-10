import 'package:aqueduct/aqueduct.dart';
import 'package:connecta_delivery/models/Usuario.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

import '../Utils.dart';
import '../connecta_delivery.dart';

class JwtMiddleware extends Controller {
JwtMiddleware(this.context);

final ManagedContext context;

@override
FutureOr<RequestOrResponse> handle(Request request) async {
  final authHeader = request.raw.headers["authorization"];

  if (authHeader.isEmpty) return Response.unauthorized();

  final authHeaderContent = authHeader[0].split(" ");
  if (authHeaderContent.length != 2 || authHeaderContent[0] != "Bearer")
    return Response.badRequest();

  String jwtToken = authHeaderContent[1];

  try {
    final JwtClaim decClaimSet =
    verifyJwtHS256Signature(jwtToken, Utils.jwtKey);

    final userId = int.parse(decClaimSet.toJson()["sub"].toString());

    if (userId == null) {
      throw JwtException;
    }

    final dataAtual = DateTime.now().toUtc();
    if (dataAtual.isAfter(decClaimSet.expiry)) {
      return Response.unauthorized();
    }

    final query = Query<Usuario>(context)
      ..where((usuario) => usuario.id).equalTo(userId);
    final user = await query.fetchOne();

    if (user == null) return Response.unauthorized();

    request.attachments['usuario'] = user;
  } on JwtException {
    return Response.unauthorized();
  }

  return request;
}
}