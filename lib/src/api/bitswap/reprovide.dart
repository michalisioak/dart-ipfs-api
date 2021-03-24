import 'package:dart_ipfs_api/src/constants.dart';
import 'package:http/http.dart' as http;

Future<String> reprovide() async {
  final response = await http.post(Uri.parse(url + "bitswap/reprovide"));
  if (response.statusCode == 200)
    return response.body;
  else
    throw Exception('Failed to reprovide');
}
