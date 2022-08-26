import 'dart:html';

import 'package:cl/app.dart' as cl_app;
import 'package:cl_base/client.dart' as base;
import 'package:communicator/client.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:job/client.dart' as job;
import 'package:person/client.dart' as person;

import 'intl/messages_all.dart';

Future<void> main() async {
  var ap = cl_app.Application(settings: cl_app.AppSettings()..baseurl = '/');

  await initData(ap);
  // await initLocale(ap);

  base.init(ap);
  person.init(ap);
  job.init(ap);

  // Setup Application Menu
  ap.setMenu([
    person.MenuItem.Person
      ..addChild(person.MenuItem.PersonNew)
    ..addChild(person.MenuItem.PersonList),
    job.MenuItem.Job
      ..addChild(job.MenuItem.JobNew)
      ..addChild(job.MenuItem.JobList)
  ]);

  ap.done();
}

Future<void> initLocale(cl_app.Application ap) async {
  var loc =
      ap.client.settings.isEmpty ? 'auto' : ap.client.settings['language'];
  var locale = (loc == 'auto') ? Intl.getCurrentLocale() : loc;
  if (locale != 'en_US') {
    await initializeMessages(locale.split('_').first);
    Intl.defaultLocale = locale;
    await initializeDateFormatting(locale, null);
  }
}

Future<void> initData(cl_app.Application ap) async {
  var communicator = Communicator(ap.baseurl);
  await communicator
      .upgrade('${window.location.protocol.endsWith('ps:') ? 'wss' : 'ws'}://'
          '${window.location.host}${ap.baseurl}ws');
  ap.on_server_call = communicator.onServerCall;
  ap.server_call = communicator.send;
  var data = await ap.serverCall('/init', null);
  ap.setClient(new cl_app.Client(data));
}
