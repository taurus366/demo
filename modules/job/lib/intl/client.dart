import 'package:intl/intl.dart';

String Job() => Intl.message('Job', name: 'Job');

String Jobs() => Intl.message('Jobs', name: 'Jobs');

String Job_list() => Intl.message('Jobs', name: 'Job_list');

String Job_new() => Intl.message('New Job', name: 'Job_new');

String Add_job() => Intl.message('Add Job', name: 'Add_job');

String job_title(dynamic id) => id == null ? job_title_new() : job_title_e(id);

String job_title_new() => Intl.message('New Job', name: 'job_title_new');

String job_title_e(Object id) =>
    Intl.message('Job # $id', name: 'job_title_e', args: [id]);

String Name() => Intl.message('Name', name: 'Name');

String Phone() => Intl.message('Phone', name: 'Phone');

String Mail() => Intl.message('Mail', name: 'Mail');

String Comment() => Intl.message('Comment', name: 'Comment');

String Title() => Intl.message('Title', name: 'Title');
