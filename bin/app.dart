import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cl_base/server.dart' as base;
import 'package:intl/date_symbol_data_local.dart';
import 'package:job/server.dart' as job;
import 'package:logging/logging.dart';
import 'package:mapper/mapper.dart' show Database, Pool;
import 'package:person/server.dart' as person;
import 'package:yaml/yaml.dart';

import 'intl/messages_all.dart';

// Base server libraries
// API libraries

/// Registering init function for each package
final List init = <Function>[base.init, person.init, job.init];

void main(List<String> args) {
  base.path = args.length == 1
      ? args.first
      : Directory.current.path.endsWith('bin')
          ? '..'
          : '.';
  base.baseURL = '';
  base.appTitle = 'Demo';
  base.logHandler();
  final log = Logger('App');
  runZonedGuarded(() async {
// Initialize default server locale
    await Future.forEach(<String>['bg'], (String locale) async {
      await initializeMessages(locale);
      await initializeDateFormatting(locale, null);
    });

// Setup database and manager
    final Map config = loadYaml(
        await File('${base.path}/config/config.yaml')
            .readAsString(encoding: utf8));

// Normally we don't want this
    base.anonymousLogin = true;

    if (config.containsKey('devmode') && config['devmode'] is bool)
      base.devmode = config['devmode'];
    final pool = Pool(
        config['db']['host'], config['db']['port'], config['db']['database'],
        user: config['db']['user'], password: config['db']['password']);
    await pool.start();
    Database().registerPool(pool);

// Iterates over init functions and starts HTTP servers
    await Future.forEach(init, (dynamic f) => f());
    await Future.wait([
      base.server(
          config['app']['centryl']['address'], config['app']['centryl']['port'])
    ]);

// SIG processing
//     void _serverDown(_) async {
//       base.onServerDown();
//       await pool.destroy();
//       log.info('Demo stopped!');
//       Timer(const Duration(seconds: 1), () => exit(0));
//     }

    // ProcessSignal.sighup.watch().listen(_serverDown);
    // ProcessSignal.sigterm.watch().listen(_serverDown);
    // ProcessSignal.sigint.watch().listen(_serverDown);
    log.info('Demo started!');
  }, (e, s) => log.shout('Error', e, s));
}
