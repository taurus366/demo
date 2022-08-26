import 'package:communicator/shared.dart';

class RoutesPerson {
  static const String $base = '/person';
  static get itemGet => UrlPattern('r/person/item/get');
  static get itemSave => UrlPattern('${$base}/item/save');
  static get itemDelete => UrlPattern('${$base}/item/delete');
  static get collectionGet => UrlPattern('${$base}/collection/get');
  static get collectionDelete => UrlPattern('${$base}/collection/delete');
  static get collectionSuggest => UrlPattern('${$base}/collection/suggest');
}
