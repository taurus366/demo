part of person.ctrl;

void routesPerson(Router router) {
  router
      .serve(RoutesPerson.itemGet, method: 'POST')
      .listen((req) => IPerson(req).get());
  router
      .serve(RoutesPerson.itemSave, method: 'POST')
      .listen((req) => IPerson(req).save());
  router
      .serve(RoutesPerson.itemDelete, method: 'POST')
      .listen((req) => IPerson(req).delete());
  router
      .serve(RoutesPerson.collectionGet, method: 'POST')
      .listen((req) => CPerson(req).get());
  router
      .serve(RoutesPerson.collectionDelete, method: 'POST')
      .listen((req) => CPerson(req).delete());
  router
      .serve(RoutesPerson.collectionSuggest, method: 'POST')
      .listen((req) => CPerson(req).suggest());
}
