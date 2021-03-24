import 'package:dart_ipfs_api/src/constants.dart';
import 'package:http/http.dart' as http;

Future<String> get(String arg,
    {bool? output,
    bool? archive,
    bool? compress,
    int? compressionLevel}) async {
  final response = await http.post(Uri.parse(url + "get"), body: {
    "output": output,
    "archive": archive,
    "compress": compress,
    "compression-level": compressionLevel,
  });
  if (response.statusCode == 200)
    return response.body;
  else
    throw Exception('get');
}
