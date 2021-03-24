import 'dart:convert';

import 'package:dart_ipfs_api/src/constants.dart';
import 'package:http/http.dart' as http;

class AddResponse {
  final int bytes;
  final String hash;
  final String name;
  final String size;

  AddResponse(this.bytes, this.hash, this.name, this.size);
}

Future<AddResponse> add(
  List<int> file, {
  bool? quite,
  bool? quiter,
  bool? silent,
  bool? progress,
}) async {
  var request = http.MultipartRequest("POST", Uri.parse(url + "add"));
  request.files.add(http.MultipartFile.fromBytes('file', file));
  request.fields.addAll({
    "quite": quite.toString(),
    "quiter": quiter.toString(),
    "silent": silent.toString(),
    "progress": progress.toString(),
    //TODO
  });
  final response = await request.send();
  if (response.statusCode == 201) {
    final res = jsonDecode(await response.stream.bytesToString());
    return AddResponse(res['Bytes'], res['Hash'], res['Name'], res['Size']);
  } else {
    throw Exception('Failed to add');
  }
}
