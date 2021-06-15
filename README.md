This project is used to perform some requests to existing db (E.g. home_db)

# Setup database #
    mysql> -u root -p

    mysql> CREATE DATABASE home_db;

    mysql> USE home_db;

    mysql> CREATE TABLE people (id INT NOT NULL AUTO_INCREMENT, name VARCHAR(40), surname VARCHAR(40), age INT, type VARCHAR(40), PRIMARY KEY(id));

    mysql> describe people;

```
+---------+-------------+------+-----+---------+----------------+
| Field   | Type        | Null | Key | Default | Extra          |
+---------+-------------+------+-----+---------+----------------+
| id      | int(11)     | NO   | PRI | NULL    | auto_increment |
| name    | varchar(40) | YES  |     | NULL    |                |
| surname | varchar(40) | YES  |     | NULL    |                |
| age     | int(11)     | YES  |     | NULL    |                |
| type    | varchar(40) | YES  |     | NULL    |                |
+---------+-------------+------+-----+---------+----------------+
```


    mysql> CREATE TABLE groups (id INT NOT NULL AUTO_INCREMENT, group_name VARCHAR(40), PRIMARY KEY (id));

    mysql> describe groups;

```
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| id         | int(11)     | NO   | PRI | NULL    | auto_increment |
| group_name | varchar(40) | YES  |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
```

    mysql> CREATE TABLE people_groups (id INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id), people_id INT, FOREIGN KEY (people_id) REFERENCES  people(id), group_id INT, FOREIGN KEY (group_id) REFERENCES groups(id));

    mysql> describe people_groups;
```
+-----------+---------+------+-----+---------+----------------+
| Field     | Type    | Null | Key | Default | Extra          |
+-----------+---------+------+-----+---------+----------------+
| id        | int(11) | NO   | PRI | NULL    | auto_increment |
| people_id | int(11) | YES  | MUL | NULL    |                |
| group_id  | int(11) | YES  | MUL | NULL    |                |
+-----------+---------+------+-----+---------+----------------+
```
# Add data to database #
    mysql> INSERT iNTO people (name, surname, age, type) VALUES ('Pasha', 'Ivanov', 29, 'engineer');

    mysql> INSERT iNTO people (name, surname, age, type) VALUES ('Vova', 'Petrenko', 31, 'worker');

    mysql> INSERT iNTO people (name, surname, age, type) VALUES ('Dima', 'Savin', 28, 'developer');

    mysql> INSERT INTO groups (group_name) VALUES ('ruby');

    mysql> INSERT INTO groups (group_name) VALUES ('trading');

    mysql> INSERT INTO people_groups (people_id, group_id) VALUES (1, 1);

    mysql> INSERT INTO people_groups (people_id, group_id) VALUES (3, 1);

    mysql> INSERT INTO people_groups (people_id, group_id) VALUES (2, 2);


Return all people by 'some_name_of_group' type to command line:

    $ruby index.rb *'some_name_of_group'*
