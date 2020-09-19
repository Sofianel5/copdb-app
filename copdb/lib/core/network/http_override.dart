import 'dart:io';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:synchronized/synchronized.dart' as sync;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)..maxConnectionsPerHost = 5;
  }
}

class PersistentIoClient extends IOClient {
  static final Client _client = PersistentIoClient(
    HttpClient()..connectionTimeout = const Duration(seconds: 15),
  );
  static Client get client => _client;
  static sync.Lock lock = sync.Lock(reentrant: true);
  PersistentIoClient([HttpClient inner]) : super(inner);
  @override
  Future<IOStreamedResponse> send(BaseRequest request) async {
    request.persistentConnection = false;
    return await super.send(request);
  }
}
