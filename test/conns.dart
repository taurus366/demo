import 'dart:async';

class MakeConn {
  static const int maxCNum = 10;

  int cnum = 0;
  int maxId = 0;
  final Map<int, String> _reqs = {};
  final Map<int, Completer<String>> _conns = {};

  Future<void> _exec() async {
    ///Return if no more connections to be made
    if (_conns.isEmpty) return;

    while (cnum < maxCNum) {
      ///Work a result that's stored
      cnum++;
      final id = _conns.keys.first;
      final creq = _reqs.remove(id);
      unawaited(_makeConn(creq!).then((cres) {
        _conns[id]!.complete(cres);
        _conns.remove(id);
        cnum--;

        ///Call myself if more results wait in queue
        if (_conns.isNotEmpty && cnum < maxCNum) unawaited(_exec());
      }));
    }
  }

  Future<String> makeConn(String req) async {
    if (cnum < maxCNum) {
      ///Directly run
      cnum++;
      final res = await _makeConn(req);
      cnum--;
      unawaited(_exec());
      return res;
    } else {
      ///Store a request for later
      _conns[++maxId] = Completer<String>();
      _reqs[maxId] = req;
      return _conns[maxId]!.future;
    }
  }

  ///Dummy function for make connection
  Future<String> _makeConn(String req) async => 'res';
}
