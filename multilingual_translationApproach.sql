Use multi;

-- CREATE TABLES
CREATE TABLE IF NOT EXISTS fruit_translation (
 id int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS  fruit_language (
  code char(2) NOT NULL,
  name varchar(20) NOT NULL,
  PRIMARY KEY (`code`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS fruit_translation_entry (
  id int(11) NOT NULL AUTO_INCREMENT,
  translation_id int(11) NOT NULL,
  language_code char(2) NOT NULL,
  fruit_name VARCHAR(255) NOT NULL,
  fruit_benefit VARCHAR(255) NOT NULL,
  fruit_season  VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`translation_id`) REFERENCES fruit_translation(`id`),
  FOREIGN KEY (`language_code`) REFERENCES  fruit_language(`code`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS fruit (
  id int(11) NOT NULL AUTO_INCREMENT,
  date_created datetime NOT NULL,
  calories int(11) NOT NULL,
  title int(11) NOT NULL DEFAULT '0',
  benefit int(11) NOT NULL DEFAULT '0',
  season int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`title`) REFERENCES  fruit_translation(`id`),
  FOREIGN KEY (`benefit`) REFERENCES fruit_translation(`id`),
  FOREIGN KEY (`season`) REFERENCES fruit_translation(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- SELECT
SELECT * FROM fruit_language;
SELECT * FROM fruit;
SELECT * FROM fruit_translation;
SELECT * FROM fruit_translation_entry;

-- Fruit Translation Inserts
INSERT INTO fruit_translation VALUES(1);
INSERT INTO fruit_translation VALUES(2);

-- Fruit Langauge Inserts
INSERT INTO fruit_language VALUES ('en', 'English');
INSERT INTO fruit_language VALUES ('ko', 'Korean');
INSERT INTO fruit_language VALUES ('fr', 'French');

-- Fruit Translation Entry Inserts
INSERT INTO fruit_translation_entry(`translation_id`, `language_code`, `fruit_name`,`fruit_benefit`,`fruit_season`)VALUES(1, 'en', 'banana','high potassium','summer');
INSERT INTO fruit_translation_entry(`translation_id`, `language_code`, `fruit_name`,`fruit_benefit`,`fruit_season`)VALUES(1, 'ko', '바나나','많은 함량의 칼륨','여름');
INSERT INTO fruit_translation_entry(`translation_id`, `language_code`, `fruit_name`,`fruit_benefit`,`fruit_season`)VALUES(1, 'fr', 'banane','plus de potassium','été');

INSERT INTO fruit_translation_entry(`translation_id`, `language_code`, `fruit_name`,`fruit_benefit`,`fruit_season`)VALUES(2, 'en', 'apple','keeps the doctor away','spring');
INSERT INTO fruit_translation_entry(`translation_id`, `language_code`, `fruit_name`,`fruit_benefit`,`fruit_season`)VALUES(2, 'ko', '사과','의사에게 가지 않아도 된다.','봄');
INSERT INTO fruit_translation_entry(`translation_id`, `language_code`, `fruit_name`,`fruit_benefit`,`fruit_season`)VALUES(2, 'fr', 'pomme',"N'allez pas au docteur",'printemps');

-- Fruit Inserts
INSERT INTO fruit VALUES(1, now(), 300, 1, 1, 1);
INSERT INTO fruit VALUES(2, now(), 180, 2, 2, 2);

-- Test Inner Join Statement to display all transaltions of a certain item
SELECT name as language_name, fruit_name, fruit_benefit, fruit_season, calories
        FROM `fruit` 
        INNER JOIN `fruit_translation_entry` ON title = translation_id
        INNER JOIN `fruit_language` ON language_code = code 
        WHERE fruit.id = 2;
        
-- Test Inner Join to display particular item with a certain translation
SELECT name as language_name, fruit_name, fruit_benefit, fruit_season, calories
        FROM `fruit` 
        INNER JOIN `fruit_translation_entry` ON title = translation_id
        INNER JOIN `fruit_language` ON language_code = code 
        WHERE fruit.id = 2 AND 
              fruit_language.code = 'fr';
-- Real Query
-- Inner Join to display all items in a certain language
SELECT fruit.id, fruit_name, fruit_benefit, fruit_season, calories
        FROM fruit 
        INNER JOIN fruit_translation_entry ON title = translation_id
        INNER JOIN fruit_language ON language_code = code 
        WHERE fruit_language.code = 'ko';

delete from fruit;
delete from fruit_translation_entry;
delete from fruit_language;
delete from fruit_translation;


drop table if exists fruit;
drop table if exists fruit_translation_entry;
drop table if exists fruit_language;
drop table if exists fruit_translation;