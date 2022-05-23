import 'dart:convert';
import 'package:crypto/crypto.dart';

class HttpController {
  final _url = 'http://gateway.marvel.com/v1/public/characters';
  final _publicKey = '195ef795ff42a798375efb93c674db77';
  final _privateKey = '986526a080c0b9081077577d98569e6fc6f4a82f';
  var _timeStamp;
  late var _hash;
  late var _urlFinal;

  void getHash() {
    _timeStamp = DateTime.now();
    var cripto = _timeStamp.toIso8601String() + _privateKey + _publicKey;
    _hash = md5.convert(utf8.encode(cripto)).toString();
  }

  String getUrlFinal() {
    getHash();
    _urlFinal =
        '$_url?ts=${_timeStamp.toIso8601String()}&apikey=$_publicKey&hash=$_hash&limit=50';
    return _urlFinal;
  }

  String getUrlFinalPesquisa(String nomePesquisa) {
    getHash();
    _urlFinal =
        '$_url?ts=${_timeStamp.toIso8601String()}&apikey=$_publicKey&hash=$_hash&limit=100&nameStartsWith=$nomePesquisa';
    return _urlFinal;
  }



  String get url => _url;
  String get timeStamp => _timeStamp.toString();
  String get privateKey => _privateKey;
}
