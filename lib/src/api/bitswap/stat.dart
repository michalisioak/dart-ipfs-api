import 'dart:convert';

import 'package:dart_ipfs_api/src/constants.dart';
import 'package:http/http.dart' as http;

class StatResponse {
  final int blocksReceived;
  final int blocksSent;
  final int dataReceived;
  final int dataSent;
  final int dupBlksReceived;
  final int dupDataReceived;
  final int messagesReceived;
  final List<String> peers;
  final int provideBufLen;
  final List<Map<String, String>> Wantlist;

  StatResponse(
      this.blocksReceived,
      this.blocksSent,
      this.dataReceived,
      this.dataSent,
      this.dupBlksReceived,
      this.dupDataReceived,
      this.messagesReceived,
      this.peers,
      this.provideBufLen,
      this.Wantlist);
}

Future<StatResponse> stat({bool? verbose, bool? human}) async {
  final response = await http.post(Uri.parse(url + "bitswap/stat"));
  if (response.statusCode == 200) {
    final res = jsonDecode(response.body);
    return StatResponse(
        res['BlocksReceived'],
        res['blocksSent'],
        res['dataReceived'],
        res['dataSent'],
        res['dupBlksReceived'],
        res['dupDataReceived'],
        res['messagesReceived'],
        res['peers'],
        res['provideBufLen'],
        res['Wantlist']);
  } else
    throw Exception('stat');
}
