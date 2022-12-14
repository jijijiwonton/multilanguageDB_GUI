USE multi;

DROP TABLE IF EXISTS bilingualFields;

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

DELETE FROM bilingualFields;

INSERT INTO bilingualFields (name_en, name_ko, calories, benefit_en, benefit_ko, season_en, season_ko) VALUES('banana', '바나나', 105, 'high potassium', '많은 함량의 칼륨', 'summer', '여름');
INSERT INTO bilingualFields (name_en, name_ko, calories, benefit_en, benefit_ko, season_en, season_ko) VALUES('whole milk', '전유', 155, 'A good source of potassium, B12, calcium and vitamin D', '칼륨, B12, 칼슘 및 비타민 D의 좋은 공급원', 'not applicable', '해당 없음');
INSERT INTO bilingualFields (name_en, name_ko, calories, benefit_en, benefit_ko, season_en, season_ko) VALUES('apple', '사과', 100, 'Rich in fiber and antioxidants', '섬유질과 항산화 물질이 풍부한', 'fall', '가을');
INSERT INTO bilingualFields (name_en, name_ko, calories, benefit_en, benefit_ko, season_en, season_ko) VALUES('other vegetables', '다른 야채', 25, 'Contains essential vitamins, minerals, and other nutrients, such as antioxidants and fiber', '필수 비타민, 미네랄 및 산화 방지제 및 섬유질과 같은 기타 영양소가 포함되어 있습니다', 'summer', '여름');
INSERT INTO bilingualFields (name_en, name_ko, calories, benefit_en, benefit_ko, season_en, season_ko) VALUES('rolls', '롤빵', 87, 'A fair amount of vitamins and minerals', '적당량의 비타민과 미네랄',  'not applicable', '해당 없음');
INSERT INTO bilingualFields (name_en, name_ko, calories, benefit_en, benefit_ko, season_en, season_ko) VALUES('potted plants', '화분에 심은 식물', 0, 'Cleans indoor air and boosts mood', '항실내 공기를 정화하고 기분을 좋게 합니다산화제', 'not applicable', '해당 없음');
INSERT INTO bilingualFields (name_en, name_ko, calories, benefit_en, benefit_ko, season_en, season_ko) VALUES('clementine', '클레멘타인', 35, 'Rich in antioxidants and vitamin C', '항산항산화제와 비타민 C가 풍부화제', 'winter', '겨울');
INSERT INTO bilingualFields (name_en, name_ko, calories, benefit_en, benefit_ko, season_en, season_ko) VALUES('artificial sweetener', '인공 감미료', 0, 'Can help with weight and diabetic blood sugar control', '체중 및 당뇨병 혈당 조절에 도움이 될 수 있습니다', 'not applicable', '해당 없음');
INSERT INTO bilingualFields (name_en, name_ko, calories, benefit_en, benefit_ko, season_en, season_ko) VALUES('beef', '쇠고기', 210, 'An excellent source of iron', '훌륭한 철분 공급원', 'not applicable', '해당 없음');
INSERT INTO bilingualFields (name_en, name_ko, calories, benefit_en, benefit_ko, season_en, season_ko) VALUES('frankfurter', '프랑크푸르트 소시지', 151, 'Full of proteins and vitamin B12', '단백질과 비타민 B12가 풍부', 'not applicable', '해당 없음');

DROP TABLE IF EXISTS multiLanguagesFields;

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

DELETE FROM multiLanguagesFields;

INSERT INTO multiLanguagesFields(`title_en`, `title_ko`, `title_ch`, `title_fr`, `title_sp`,  `benefit_en`, `benefit_ko`, `benefit_ch`, `benefit_fr`, `benefit_sp`) 
VALUES ('banana', '바나나', '香蕉', 'banane', 'plátano', 'A great source of potassium', '칼륨의 훌륭한 공급원', '钾的重要来源', 'Une excellente source de potassium', 'Una gran fuente de potasio');
INSERT INTO multiLanguagesFields(`title_en`, `title_ko`, `title_ch`, `title_fr`, `title_sp`,  `benefit_en`, `benefit_ko`, `benefit_ch`, `benefit_fr`, `benefit_sp`) 
VALUES ('whole milk', '전유', '全脂牛奶', 'lait entier', 'leche entera','A good source of potassium, B12, calcium and vitamin D', '칼륨, B12, 칼슘 및 비타민 D의 좋은 공급원', '鉀、B12、鈣和維生素 D 的良好來源', 'Bonne source de potassium, B12, calcium et vitamine D', 'Buena fuente de potasio, B12, calcio y vitamina D');
INSERT INTO multiLanguagesFields(`title_en`, `title_ko`, `title_ch`, `title_fr`, `title_sp`,  `benefit_en`, `benefit_ko`, `benefit_ch`, `benefit_fr`, `benefit_sp`) 
VALUES ('apple', '사과', '蘋果', 'pomme', 'manzana','Rich in fiber and antioxidants', '섬유질과 항산화 물질이 풍부한', '富含纖維和抗氧化劑', 'Riche en fibres et en antioxydants', 'Rica en fibra y antioxidantes');
INSERT INTO multiLanguagesFields(`title_en`, `title_ko`, `title_ch`, `title_fr`, `title_sp`,  `benefit_en`, `benefit_ko`, `benefit_ch`, `benefit_fr`, `benefit_sp`) 
VALUES ('other vegetables', '다른 야채', '其他蔬菜', 'autres légumes', 'otras verduras', 'Contains essential vitamins, minerals, and other nutrients, such as antioxidants and fiber', '필수 비타민, 미네랄 및 산화 방지제 및 섬유질과 같은 기타 영양소가 포함되어 있습니다', '含有必需的维生素、矿物质和其他营养素，例如抗氧化剂和纤维', 'Contient des vitamines, des minéraux et d''autres nutriments essentiels, tels que des antioxydants et des fibres', 'Contiene vitaminas esenciales, minerales y otros nutrientes, como antioxidantes y fibra');
INSERT INTO multiLanguagesFields(`title_en`, `title_ko`, `title_ch`, `title_fr`, `title_sp`,  `benefit_en`, `benefit_ko`, `benefit_ch`, `benefit_fr`, `benefit_sp`) 
VALUES ('rolls', '롤빵', '麵包卷', 'petit pain', 'bollilos', 'A fair amount of vitamins and minerals', '적당량의 비타민과 미네랄', '适量的维生素和矿物质', 'Une bonne quantité de vitamines et de minéraux', 'Una buena cantidad de vitaminas y minerales');
INSERT INTO multiLanguagesFields(`title_en`, `title_ko`, `title_ch`, `title_fr`, `title_sp`,  `benefit_en`, `benefit_ko`, `benefit_ch`, `benefit_fr`, `benefit_sp`) 
VALUES ('potted plants', '화분에 심은 식물', '盆栽', 'plantes en pot', 'plantas en macetas','Cleans indoor air and boosts mood', '실내 공기를 정화하고 기분을 좋게 합니다', '净化室内空气，提振心情', 'Purifie l''air intérieur et stimule l''humeur', 'Limpia el aire interior y mejora el estado de ánimo');
INSERT INTO multiLanguagesFields(`title_en`, `title_ko`, `title_ch`, `title_fr`, `title_sp`,  `benefit_en`, `benefit_ko`, `benefit_ch`, `benefit_fr`, `benefit_sp`) 
VALUES ('clementine', '클레멘타인', '克莱门汀', 'clémentine', 'clementina', 'Rich in antioxidants and vitamin C', '항산화제와 비타민 C가 풍부', '富含抗氧化剂和维生素C', 'Riche en antioxydants et en vitamine C', 'Rica en antioxidantes y vitamina C');
INSERT INTO multiLanguagesFields(`title_en`, `title_ko`, `title_ch`, `title_fr`, `title_sp`,  `benefit_en`, `benefit_ko`, `benefit_ch`, `benefit_fr`, `benefit_sp`) 
VALUES ('artificial sweetener', '인공 감미료', '人造甜味剂', 'édulcorant artificiel', 'endulzante artificial', 'Can help with weight and diabetic blood sugar control', '체중 및 당뇨병 혈당 조절에 도움이 될 수 있습니다', '可以帮助控制体重和控制糖尿病患者的血糖', 'Peut aider à contrôler le poids et la glycémie diabétique', 'Puede ayudar a controlar el peso y la glicemia de los diabéticos');
INSERT INTO multiLanguagesFields(`title_en`, `title_ko`, `title_ch`, `title_fr`, `title_sp`,  `benefit_en`, `benefit_ko`, `benefit_ch`, `benefit_fr`, `benefit_sp`) 
VALUES ('beef', '쇠고기', '牛肉', 'bœuf', 'carne de res', 'An excellent source of iron', '훌륭한 철분 공급원', '铁的极好来源', 'Une excellente source de fer', 'Una excelente fuente de hierro');
INSERT INTO multiLanguagesFields(`title_en`, `title_ko`, `title_ch`, `title_fr`, `title_sp`,  `benefit_en`, `benefit_ko`, `benefit_ch`, `benefit_fr`, `benefit_sp`) 
VALUES ('frankfurter', '프랑크푸르트 소시지', '法兰克福香肠', 'saucisse', 'salchicha', 'Full of proteins and vitamin B12', '단백질과 비타민 B12가 풍부', '富含蛋白质和维生素 B12', 'Plein de protéines et de vitamine B12', 'Llena de proteínas y vitamina B12');

SELECT * FROM bilingualFields;
SELECT * FROM multiLanguagesFields;
