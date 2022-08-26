part of job.ctrl;

void routesJob(Router router) => router
  ..serve(RoutesJob.itemGet, method: 'WS').listen((req) => IJob(req).get())
  ..serve(RoutesJob.itemSave, method: 'WS').listen((req) => IJob(req).save())
  ..serve(RoutesJob.itemDelete, method: 'WS')
      .listen((req) => IJob(req).delete())
  ..serve(RoutesJob.collectionGet, method: 'WS')
      .listen((req) => CJob(req).get())
  ..serve(RoutesJob.collectionDelete, method: 'WS')
      .listen((req) => CJob(req).delete());
