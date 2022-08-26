import 'package:intl/intl.dart';

Person() => Intl.message('Person', name: 'Person');
Persons() => Intl.message('People', name: 'Persons');
Person_list() => Intl.message('People', name: 'Person_list');
Person_new() => Intl.message('New Person', name: 'Person_new');
Add_person() => Intl.message('Add Person', name: 'Add_person');

person_title(id) => id == null ? person_title_new() : person_title_e(id);
person_title_new() => Intl.message('New Person', name: 'person_title_new');
person_title_e(id) =>
    Intl.message('Person # $id', name: 'person_title_e', args: [id]);

Age() => Intl.message('Age', name: 'Age');
Name() => Intl.message('Name', name: 'Name');
Phone() => Intl.message('Phone', name: 'Phone');
Mail() => Intl.message('Mail', name: 'Mail');
Comment() => Intl.message('Comment', name: 'Comment');
Birth() => Intl.message('Birth', name: 'Birth');
// added new field
Salary() => Intl.message('Salary', name: 'Salary');
