# Application Setup

### Config Settings
#### Create the file and folder structure
```
config/config.yaml
```
#### with the following content
```
devmode: true
app:
  centryl:
    address: 127.0.0.1
    port: 9000
  api:
    address: 127.0.0.1
    port: 9002
  front:
    address: 127.0.0.1
    port: 9003

db:
  host: localhost
  port: 5432
  user: user
  password: 'user'
  database: demo
```
#### Create the following folder structure
```
media
tmp
log
log/nginx
```
### Create database and role (user)
#### From the psql console as superuser (postgres):
```
CREATE ROLE "user" NOSUPERUSER NOCREATEDB NOCREATEROLE NOINHERIT LOGIN ENCRYPTED PASSWORD 'password';
CREATE DATABASE "demo" WITH OWNER="user" encoding='UTF-8' lc_collate='en_US.utf8' lc_ctype='en_US.utf8' template template0;
REVOKE ALL ON DATABASE "demo" FROM public;
GRANT ALL ON SCHEMA public TO "user" WITH GRANT OPTION;
\connect "demo";
ALTER SCHEMA public OWNER TO "user";
```
### Configure global executables
#### Webdev
```
dart pub global activate webdev
```
#### SSH PORT 22005 FOR REPO
```
File "config" in your .ssh folder should contain the following lines

Host repo.centryl.org
Port 22005
```
#### Download specific version of DART
```
https://dart.dev/get-dart/archive
```
#### Add PATH
```
In your home folder in file .bashrc add following line

export PATH="$PATH:$HOME/dart/dart-sdk/bin:$HOME/.pub-cache/bin:$HOME/flutter/bin"
```
#### Cl_dev
```
dart pub global activate -sgit git@repo.centryl.org:base/cl_dev.git
```

#### Install DB
```
cl_install -r
```

### Nginx Setup
#### SSL Support - create and execute the following:
```
#!/bin/sh

nginx=/etc/nginx
mkdir $nginx/ssl
cd $nginx/ssl
openssl req -x509 -nodes -days 3650 -newkey rsa:4096 -keyout server.key -out server.crt
```
#### Generate nginx file
```
cl_nginx > config/centryl-nginx
```
#### Create link to the generated file
```
cd /etc/nginx/sites-enabled
ln -s [project_path]/config/centryl-nginx ./
```
#### Reload Nginx
```
/etc/init.d/nginx reload
```

### Running the application

#### Run the server
```
dart bin/app.dart
```
#### Run webdev
```
cl_serve
```

#### Access the Application
```
https://localhost
```

# Configuring Webstorm to run the project
#### Create file nginx.c
```
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
   setuid( 0 );
   clearenv();
   const char* part1    = "rm /etc/nginx/sites-enabled/centryl-nginx;";
   const char* part2    = "ln -s $PWD/config/centryl-nginx /etc/nginx/sites-enabled/centryl-nginx;";
   const char* part3    = "/usr/sbin/nginx -s reload;";
   char* str0           = malloc(strlen(part1) + strlen(part2) + strlen(part3) + 1);
   strcpy(str0,part1);
   strcat(str0,part2);
   strcat(str0,part3);
   system(str0);
   return 0;
}
```
#### Compile nginx.c
```
gcc nginx.c -o nginx
```
#### Set the permissions
```
chown root.root nginx
chmod +s nginx
```
#### Create nginx external tool
##### Settings > Tools > External Tools > '+'
```
name: nginx_autoreload
```
##### Tool Settings section
```
Program: /path_to/nginx
Working directory: $ProjectFileDir$
```
* Note $ProjectFileDir$ is an Webstorm variable and should be written as is

#### Create the configuration
##### Edit configurations > Add configuration > Dart Command Line App
```
Dart file: /project_path/bin/app
Working directory: /project_path
```
##### Before launch > '+' > Run External tool and choose the tool

#### Modifing the data

1. Edit specific file in model directory (modules/xxxx/db/entity/mod.dart)
2. Write the specific patch and change create.sql file in 
(modules/xxxx/db/schema).
 - in schema you should have a folder patch
 - create a patch file ```n.2021-12-23.sql```. Where n is the number of the patch file
 for this module. Should be the next after the last that you have in the folder.
 2021-12-23 is the date of the patch ```YYYY-MM-DD```.
 - Go back and in create.sql edit the table you need to change
3. Go to module root folder and run "date pub run build_runner build" 
 - If you have a cl_base in your pubspec.yaml it should regenerate your
 serialization/deserialization functions according to your new entities and
 dtos for this module.
4. Changing fields usually means changing conditions in the mapper file so
take a look and if you need to change or add the new column in the CollectionBuilder.
Do that.
5. If the new field leads to a new table you will need to modify lister funciton in your
controller for this object.
6. In GUI you usually have two files connected to this model.
 - One item editor
 - List of items
 - ```You should add the new fields in order to work with them. ```

#### Commands in CL_DEV

1. Generate an empty database
 - dart pub global run cl_dev:gen_db
2. Generate database PATCH from all modules patches  
 - dart pub global run cl_dev:gen_db_update
 - Or combine it with database tool like this
 - dart pub global run cl_dev:gen_db_update | psql -ddemo
3. ReCreate serialization/deserialization scripts  
 - You must be in the modules' root folder when you do that
 - dart run build_runner build

#### Tasks to do with the interface
1. Add a column in job or person
 - Add the column in entity
 - Add the column in database both, create.sql and patch
 - Add the column in the mapper for search
 - Rebuild serialization / deserialization scripts
 - Add the column in gui both in ItemBuilder and in List of items
 
2. Make a custom filter for a column in database.
For example "salary".
 - Follow previous dot (1)
 - Add text fields for minimum/maximum salary. For example
you can put them in entity for easy use or just use them as string.
Second option may lead to easy mistakes.
  - Add these fields into the filter in mapper - how they 
  are filtered and which field do they match.
  - Add these fields into the listing filter
  - If you have done everything right then it should be working.
  
3. Make different query so the Listing can load and filter names 
with "like", "ilike" and sort them letter by letter.
 - In the mapper (CollectionBuilder()). You should use a custom 
 builder Object which covers both tables "person" and "job" joined
 so you can filter all the fields.
 Something like
``` 
 select p.*, j.* from "person" as p, left join "job" as j
  on j.person_id = p.person_id;

 * Note: you need to use map = {} here to specify in which table 
are filters located when you describe them in CollectionBuilder.

``` 
3. Make a different entity like JOB Title which can contain
 title_id, title
4. Join this table's IDS to JOB by adding title_id to JOB table
5. Make InputLoader for the field job title
 - You need to add pair() method in entity
 - Suggest method in mapper
 - Suggest method in controller ( see person )
 - Add proper route
 - make a list for the new table
 - finally you can finish up with the InputLoader and use it
 in job.

6. Creating custom Builder
   - Builder()
        ..select('t.*')
        ..addSelect('c.*')
        ..from('table1 t')
        ..leftJoint('table2 c', 't.key = c.key')
        ..andWhere('...')
        ..order
        ..group
        ..limit
        ...
    - You will need a custom builder to join tables or make some
    custom database queries.
