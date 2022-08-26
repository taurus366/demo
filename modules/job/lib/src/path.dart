import 'package:communicator/shared.dart';

class RoutesJob {
  static get itemGet => UrlPattern('r/job/item/get');
  static get itemSave => UrlPattern(r'/job/item/save');
  static get itemDelete => UrlPattern(r'/job/item/delete');
  static get collectionGet => UrlPattern(r'/job/collection/get');
  static get collectionDelete => UrlPattern(r'/job/collection/delete');
}
