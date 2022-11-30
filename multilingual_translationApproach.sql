Use multi;

drop table if exists product;
drop table if exists product_translation_entry;
drop table if exists product_language;
drop table if exists product_translation;

CREATE TABLE IF NOT EXISTS product_translation (
 id int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
);
-- ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

delete from product_translation;

INSERT INTO product_translation VALUES(1);
INSERT INTO product_translation VALUES(2);
INSERT INTO product_translation VALUES(3);
INSERT INTO product_translation VALUES(4);
INSERT INTO product_translation VALUES(5);
INSERT INTO product_translation VALUES(6);
INSERT INTO product_translation VALUES(7);
INSERT INTO product_translation VALUES(8);
INSERT INTO product_translation VALUES(9);
INSERT INTO product_translation VALUES(10);

CREATE TABLE IF NOT EXISTS  product_language (
  code char(2) NOT NULL,
  name varchar(20) NOT NULL,
  PRIMARY KEY (`code`)
);
-- ENGINE=InnoDB DEFAULT CHARSET=latin1;

delete from product_language;

INSERT INTO product_language VALUES ('en', 'English');
INSERT INTO product_language VALUES ('ko', 'Korean');
INSERT INTO product_language VALUES ('fr', 'French');

CREATE TABLE IF NOT EXISTS product_translation_entry (
  id int(11) NOT NULL AUTO_INCREMENT,
  translation_id int(11) NOT NULL,
  language_code char(2) NOT NULL,
  product_name VARCHAR(255) NOT NULL,
  product_benefit VARCHAR(255) NOT NULL,
  product_season  VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`translation_id`) REFERENCES product_translation(`id`),
  FOREIGN KEY (`language_code`) REFERENCES  product_language(`code`)
);
-- ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1

delete from product_translation_entry;


INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(1, 'en', 'banana','high potassium','summer');
INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(1, 'ko', '바나나','많은 함량의 칼륨','여름');
INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(1, 'fr', 'banane','plus de potassium','été');

INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(2, 'en', 'whole milk','A good source of potassium, B12, calcium and vitamin D','not applicable');
INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(2, 'ko', '전유','칼륨, B12, 칼슘 및 비타민 D의 좋은 공급원.','해당 없음');
INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(2, 'fr', 'lait entier','Bonne source de potassium, B12, calcium et vitamine D','n''est pas applicable');

INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(3, 'en', 'apple','Rich in fiber and antioxidants','fall');
INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(3, 'ko', '사과','섬유질과 항산화 물질이 풍부한','가을');
INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(3, 'fr', 'pomme','Riche en fibres et en antioxydants','automne');

INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(4, 'en', 'other vegetables','Contains essential vitamins, minerals, and other nutrients, such as antioxidants and fiber','summer');
INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(4, 'ko', '다른 야채','필수 비타민, 미네랄 및 산화 방지제 및 섬유질과 같은 기타 영양소가 포함되어 있습니다','여름');
INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(4, 'fr', 'pomme','Contient des vitamines, des minéraux et d''autres nutriments essentiels, tels que des antioxydants et des fibres','été');

INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(5, 'en', 'rolls','A fair amount of vitamins and minerals','not applicable');
INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(5, 'ko', '롤빵','적당량의 비타민과 미네랄.','해당 없음');
INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(5, 'fr', 'petit pain','Une bonne quantité de vitamines et de minéraux','n''est pas applicable');

INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(6, 'en', 'potted plants','Cleans indoor air and boosts mood','not applicable');
INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(6, 'ko', '화분에 심은 식물','실내 공기를 정화하고 기분을 좋게 합니다.','해당 없음');
INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(6, 'fr', 'plantes en pot','Purifie l''air intérieur et stimule l''humeur','n''est pas applicable');

INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(7, 'en', 'clementine','Rich in antioxidants and vitamin C','winter');
INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(7, 'ko', '클레멘타인','항산화제와 비타민 C가 풍부','겨울');
INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(7, 'fr', 'clémentine','Riche en antioxydants et en vitamine C','l''hiver');

INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(8, 'en', 'artificial sweetener','Can help with weight and diabetic blood sugar control','not applicable');
INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(8, 'ko', '인공 감미료','체중 및 당뇨병 혈당 조절에 도움이 될 수 있습니다','해당 없음');
INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(8, 'fr', 'édulcorant artificiel','Peut aider à contrôler le poids et la glycémie diabétique','n''est pas applicable');

INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(9, 'en', 'beef','An excellent source of iron','not applicable');
INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(9, 'ko', '쇠고기','훌륭한 철분 공급원','해당 없음');
INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(9, 'fr', 'bœuf','Une excellente source de fer','n''est pas applicable');

INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(10, 'en', 'frankfurter','Full of proteins and vitamin B12','not applicable');
INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(10, 'ko', '프랑크푸르트 소시지','단백질과 비타민 B12가 풍부','해당 없음');
INSERT INTO product_translation_entry(`translation_id`, `language_code`, `product_name`,`product_benefit`,`product_season`)VALUES(10, 'fr', 'saucisse','Plein de protéines et de vitamine B12','n''est pas applicable');

CREATE TABLE IF NOT EXISTS product (
  id int(11) NOT NULL AUTO_INCREMENT,
  date_created datetime NOT NULL,
  calories int(11) NOT NULL,
  title int(11) NOT NULL DEFAULT '0',
  benefit int(11) NOT NULL DEFAULT '0',
  season int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`title`) REFERENCES  product_translation(`id`),
  FOREIGN KEY (`benefit`) REFERENCES product_translation(`id`),
  FOREIGN KEY (`season`) REFERENCES product_translation(`id`)
);
-- ENGINE=InnoDB DEFAULT CHARSET=latin1;

delete from product;

INSERT INTO product VALUES(1, now(), 105, 1, 1, 1);
INSERT INTO product VALUES(2, now(), 155, 2, 2, 2);
INSERT INTO product VALUES(3, now(), 100, 3, 3, 3);
INSERT INTO product VALUES(4, now(), 25, 4, 4, 4);
INSERT INTO product VALUES(5, now(), 87, 5, 5, 5);
INSERT INTO product VALUES(6, now(), 0, 6, 6, 6);
INSERT INTO product VALUES(7, now(), 35, 7, 7, 7);
INSERT INTO product VALUES(8, now(), 0, 8, 8, 8);
INSERT INTO product VALUES(9, now(), 210, 9, 9, 9);
INSERT INTO product VALUES(10, now(), 151, 10, 10, 10);

-- SELECT NORMALLY
SELECT * FROM product_language;
SELECT * FROM product;
SELECT * FROM product_translation;
SELECT * FROM product_translation_entry;

-- Test Inner Join Statement to display all transaltions of a certain item
SELECT name as language_name, product_name, product_benefit, product_season, calories
        FROM `product` 
        INNER JOIN `product_translation_entry` ON title = translation_id
        INNER JOIN `product_language` ON language_code = code 
        WHERE product.id = 2;
        
-- Test Inner Join to display particular item with a certain translation
SELECT name as language_name, product_name, product_benefit, product_season, calories
        FROM `product` 
        INNER JOIN `product_translation_entry` ON title = translation_id
        INNER JOIN `product_language` ON language_code = code 
        WHERE product.id = 2 AND 
              product_language.code = 'fr';
-- Real Query
-- Inner Join to display all items in a certain language
SELECT product.id, product_name, product_benefit, product_season, calories
        FROM product
        INNER JOIN product_translation_entry ON title = translation_id
        INNER JOIN product_language ON language_code = code 
        WHERE product_language.code = 'ko';

-- Insert testing
