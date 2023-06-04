--
-- ������ ������������ Devart dbForge Studio 2020 for MySQL, ������ 9.0.391.0
-- �������� �������� ��������: http://www.devart.com/ru/dbforge/mysql/studio
-- ���� �������: 04.06.2023 15:15:20
-- ������ �������: 8.0.32
-- ������ �������: 4.1
--

-- 
-- ���������� ������� ������
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- ���������� ����� SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

--
-- ��������� ���� ������ �� ���������
--
USE malldb;

--
-- ������� ������� `tbl_stat`
--
DROP TABLE IF EXISTS tbl_stat;

--
-- ������� ������� `tbl_cardhall`
--
DROP TABLE IF EXISTS tbl_cardhall;

--
-- ������� ������� `tbl_hall`
--
DROP TABLE IF EXISTS tbl_hall;

--
-- ������� ������� `tbl_pavilion`
--
DROP TABLE IF EXISTS tbl_pavilion;

--
-- ������� ������� `tbl_rooms`
--
DROP TABLE IF EXISTS tbl_rooms;

--
-- ��������� ���� ������ �� ���������
--
USE malldb;

--
-- ������� ������� `tbl_rooms`
--
CREATE TABLE tbl_rooms (
  IdRoom int NOT NULL AUTO_INCREMENT,
  RoomName varchar(255) DEFAULT NULL,
  PRIMARY KEY (IdRoom)
)
ENGINE = INNODB,
AUTO_INCREMENT = 10,
AVG_ROW_LENGTH = 2730,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- ������� ������� `tbl_pavilion`
--
CREATE TABLE tbl_pavilion (
  Idpav int NOT NULL AUTO_INCREMENT,
  PavName varchar(255) DEFAULT NULL,
  PavOwner varchar(255) DEFAULT NULL,
  PavMenag varchar(255) DEFAULT NULL,
  PavTeleph varchar(255) DEFAULT NULL,
  PavMail varchar(255) DEFAULT NULL,
  PavAdre varchar(255) DEFAULT NULL,
  PavTitle varchar(255) DEFAULT NULL,
  PavStatistic int DEFAULT NULL,
  PRIMARY KEY (Idpav)
)
ENGINE = INNODB,
AUTO_INCREMENT = 110,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- ������� ������ `FK_tbl_pavilion_tbl_graf_IdGraf` ��� ������� ���� ������� `tbl_pavilion`
--
ALTER TABLE tbl_pavilion
ADD INDEX FK_tbl_pavilion_tbl_graf_IdGraf (PavStatistic);

--
-- ������� ������� `tbl_hall`
--
CREATE TABLE tbl_hall (
  IdHall int NOT NULL AUTO_INCREMENT,
  HallSide varchar(255) DEFAULT NULL,
  PRIMARY KEY (IdHall)
)
ENGINE = INNODB,
AUTO_INCREMENT = 10,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- ������� ������� `tbl_cardhall`
--
CREATE TABLE tbl_cardhall (
  IdCard int NOT NULL AUTO_INCREMENT,
  CardPav int DEFAULT NULL,
  CardHall int DEFAULT NULL,
  CardRoom int DEFAULT NULL,
  CardStat int DEFAULT NULL,
  PRIMARY KEY (IdCard)
)
ENGINE = INNODB,
AUTO_INCREMENT = 71,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- ������� ������ `FK_tbl_cardhall_tbl_stat_IdStat` ��� ������� ���� ������� `tbl_cardhall`
--
ALTER TABLE tbl_cardhall
ADD INDEX FK_tbl_cardhall_tbl_stat_IdStat (CardStat);

--
-- ������� ������� ����
--
ALTER TABLE tbl_cardhall
ADD CONSTRAINT FK_tbl_cardhall_tbl_hall_IdHall FOREIGN KEY (CardHall)
REFERENCES tbl_hall (IdHall);

--
-- ������� ������� ����
--
ALTER TABLE tbl_cardhall
ADD CONSTRAINT FK_tbl_cardhall_tbl_pavilion_Idpav FOREIGN KEY (CardPav)
REFERENCES tbl_pavilion (Idpav);

--
-- ������� ������� ����
--
ALTER TABLE tbl_cardhall
ADD CONSTRAINT FK_tbl_cardhall_tbl_rooms_IdRoom FOREIGN KEY (CardRoom)
REFERENCES tbl_rooms (IdRoom);

--
-- ������� ������� `tbl_stat`
--
CREATE TABLE tbl_stat (
  IdStat int NOT NULL AUTO_INCREMENT,
  StatProf int DEFAULT NULL,
  StatLoss int DEFAULT NULL,
  StatData date DEFAULT NULL,
  StatCardID int DEFAULT NULL,
  PRIMARY KEY (IdStat)
)
ENGINE = INNODB,
AUTO_INCREMENT = 20,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- ������� ������� ����
--
ALTER TABLE tbl_stat
ADD CONSTRAINT FK_tbl_stat_tbl_cardhall_CardStat FOREIGN KEY (StatCardID)
REFERENCES tbl_cardhall (CardStat);

-- 
-- ����� ������ ��� ������� tbl_rooms
--
INSERT INTO tbl_rooms VALUES
(2, 'Фудкорт'),
(3, 'Склад'),
(4, 'Комната администрации'),
(5, 'Комната охраны'),
(6, 'Точка продажи'),
(7, 'Комната сотрудников'),
(8, 'Уборная');

-- 
-- ����� ������ ��� ������� tbl_pavilion
--
INSERT INTO tbl_pavilion VALUES
(1, 'Одежда', 'Осликов И.А.', 'Петров Х.Р.', '+7 (423) 250-02-1533', 'gjgf@gmail', 'ул. Верзина дом 38 каббинет 92', '"Элеонора"', 1),
(2, 'Обувь', 'Пчёлкин Б.З.', 'Плашев Э.Л.', '8 800 555 35 35', 'pipipupu@gmail', 'ул. Уличная дом 237 кабинет 92', '"Кефтеме"', 2),
(3, 'Подарки', 'Коровина М.У.', 'Шотган Ш.Б.', '(423) 243-22-42', 'devo4kawensday@gmail', 'ул. Ломоносова дом 34 кабмнет 6 ', '"Поздравок"', 3),
(4, 'Фудкорт', 'Пираткин А.Р.', 'Бочкин Д.И.', '+7 (994) 222-97-10', 'ukpook@gmail', 'ул. Прытина дом 10 кабинет 1119', '"Шифанька"', 4),
(5, 'Охрана', 'Гранин О.О.', 'Камнев К.Г.', '+7 902 481-33-33', 'gigachad@gmail', 'ул. Тупик надежды дом 99 кабинет 84', 'без названия', 5),
(7, 'Парикмахерская', 'Смолина Т.В.', 'Лугин Е.Т.', '+7 984 145-41-76\r\n', 'phooga@gmail', 'ул. Луцкого 16 дом 6 кабинет 6', '"Наталья"', NULL),
(8, 'Фитнесклуб', 'Абрамов Л.Д.', 'Сполохов Р.Ю.', '+7 (423) 200-02-14', 'nogivonyaut@gmail', 'ул. Светланская дом 114 кабинет 23', '"Атлет"', NULL),
(10, 'Ткани', 'Навцева К.И.', 'Трабина А.А.', '+7 (423) 206-03-26', 'erenyeger@gmail.com', 'ул. Добровольского дом 20 кабинет 2', '"Ниточка"', NULL),
(11, 'Техника', 'Нечаев С.Т.', 'Чатков Е.И.', '+7 (423) 272-17-21', 'grmoroy@gmail', 'ул. Вилкова дом 14а кабинет 122', '"Кибертрон"', NULL),
(12, 'Детский', 'Крупина Н.Ф.', 'Фролова У.П.', '+7 962 838-56-98', 'traktor@gmail', 'ул. Кирова дом 36 кабинет 43', '"Карапуз"', NULL),
(28, 'Кальяная', 'Натарьев П.Л.', 'Новиков Д.Д.', '+7 916 710-85-55', 'eojrop@gmail.com', 'ул. Океанская дом 34 кабинет 2 ', '"Султан"', NULL),
(105, 'Охрана', 'Бублик П.П.', 'орщшрщ', '465456', NULL, NULL, 'Без названия', NULL),
(106, 'арв', 'ппвпва', NULL, NULL, NULL, NULL, 'ррав', NULL),
(107, 'омрмгн', NULL, 'ган', NULL, NULL, NULL, 'ирииииг', NULL),
(108, 'шгпшпгшп', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(109, 'екткт', NULL, NULL, NULL, NULL, NULL, 'у', NULL);

-- 
-- ����� ������ ��� ������� tbl_hall
--
INSERT INTO tbl_hall VALUES
(1, 'Западный'),
(2, 'Северный'),
(3, 'Восточный'),
(4, 'Центральный'),
(5, 'Южный');

-- 
-- ����� ������ ��� ������� tbl_cardhall
--
INSERT INTO tbl_cardhall VALUES
(1, 1, 3, 6, 1),
(2, 2, 5, 6, 1),
(3, 3, 1, 6, 2),
(4, 4, 2, 2, 2),
(5, 5, 4, 6, 2),
(6, 11, 1, 6, 2),
(7, 10, 3, 6, 1),
(66, 105, 2, 6, 2);

-- 
-- ����� ������ ��� ������� tbl_stat
--
INSERT INTO tbl_stat VALUES
(2, 3135, 165164, '2023-05-17', 1),
(3, 48948, 6222, '2023-05-30', 1),
(4, 5000, 625, '2023-05-17', 2),
(5, 3332, 3332, '2023-05-30', 1),
(6, 266511, 4616, '2023-03-28', 2);

-- 
-- ������������ ���������� ����� SQL (SQL mode)
--
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- ��������� ������� ������
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;