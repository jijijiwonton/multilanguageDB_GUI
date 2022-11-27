USE multi;

-- How to create a table with bilingual language fields

-- We have to add a field for different timezone
CREATE TABLE IF NOT EXISTS bilingualFields (
  id int(10) NOT NULL AUTO_INCREMENT,
  name_en varchar(50) NOT NULL,
  name_ko varchar(50) NOT NULL,
  calories int NOT NULL,
  benefit_en varchar(255) NOT NULL,
  benefit_ko varchar(255) NOT NULL,
  season_en varchar(10) NOT NULL,
  season_ko varchar(10) NOT NULL,
  created_en datetime,
  create_ko datetime,
  PRIMARY KEY (`id`)
);
-- Insert records with bilingual fields table
INSERT INTO bilingualFields (name_en, name_ko, calories, benefit_en, benefit_ko, season_en, season_ko) VALUES('banana', '바나나', 112, 'antioxidants', '항산화제', 'winter', '겨울');

DELETE FROM bilingualFields;

SELECT * FROM bilingualFields;

DROP TABLE IF EXISTS bilingualFields;

-- How to create a table with multi-languages fields
CREATE TABLE IF NOT EXISTS multiLanguagesFields (
  id int(10) NOT NULL AUTO_INCREMENT,
  title_en varchar(255) NOT NULL,
  title_ko varchar(255) NOT NULL,
  title_ch varchar(255) NOT NULL,
  title_fr varchar(255) NOT NULL,
  title_sp varchar(255) NOT NULL,
  benefit_en varchar(255) NOT NULL,
  benefit_ko varchar(255) NOT NULL,
  benefit_ch varchar(255) NOT NULL,
  benefit_fr varchar(255) NOT NULL,
  benefit_sp varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

-- Insert records with multilangue fields table
INSERT INTO multiLanguagesFields(`title_en`, `title_ko`, `title_ch`, `title_fr`, `title_sp`,  `benefit_en`, `benefit_ko`, `benefit_ch`, `benefit_fr`, `benefit_sp`) 
VALUES ('banana', '바나나', '香蕉', 'banane', 'plátano','A fair amount of fiber and several antioxidants', '상당한 양의 섬유질과 다양한 항산화제', '大量的纤维和各种抗氧化剂', 'Alto en fibra y una variedad de antioxidantes', 'Una buena cantidad de fibra y varios antioxidantes');

DELETE FROM multiLanguagesFields;

-- How to retreive data from a bilingual fields table
SELECT * FROM multiLanguagesFields;

DROP TABLE IF EXISTS multiLanguagesFields;