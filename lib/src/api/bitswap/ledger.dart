import 'dart:convert';

import 'package:dart_ipfs_api/src/constants.dart';
import 'package:http/http.dart' as http;

class LedgerResponse {
  final int exchanged;
  final String peer;
  final int recv;
  final int send;
  final double value;

  LedgerResponse(this.exchanged, this.peer, this.recv, this.send, this.value);
}

Future<LedgerResponse> ledger(String arg) async {
  final response = await http.post(Uri.parse(url + "bitswap/ledger"));
  if (response.statusCode == 200) {
    final res = jsonDecode(await response.body);
    return LedgerResponse(
        res['Exchanged'], res['Peer'], res['Recv'], res['Send'], res['Value']);
  } else {
    throw Exception('Failed to ledger');
  }
}
