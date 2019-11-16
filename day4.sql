DROP DATABASE day4_homework;
CREATE DATABASE day4_homework;
USE day4_homework;

CREATE TABLE stu
(
    s_id   INT PRIMARY KEY,
    s_name VARCHAR(20),
    addr   VARCHAR(50),
    tel    VARCHAR(50)
);
INSERT INTO stu
VALUES (1, 'XiaoWang', 'Henan', '0371-12345678'),
       (2, 'XiaoLi', 'Hebei', '13889072345'),
       (3, 'XiaoTian', 'Henan', '0371-12345670');

CREATE TABLE sch
(
    sch_id   INT PRIMARY KEY,
    sch_name VARCHAR(20)
);
INSERT INTO sch
VALUES (1, '清华大学'),
       (2, '北京大学');


CREATE TABLE stu_mark
(
    mark_id INT PRIMARY KEY,
    s_id    int,
    sch_id  int
);
INSERT INTO stu_mark
VALUES (1, 1, 1),
       (2, 2, 2),
       (3, 3, 2);
drop table if EXISTS  user_log;
CREATE TABLE user_log
(
    log_id     INT AUTO_INCREMENT PRIMARY KEY,
    user_id    int,
    last_login date
);

INSERT INTO user_log (user_id, last_login)
VALUES (1, DATE_SUB(CURDATE(), INTERVAL 1 DAY)),
       (2, DATE_SUB(CURDATE(), INTERVAL 20 DAY)),
       (3, DATE_SUB(CURDATE(), INTERVAL 40 DAY)),
       (1, DATE_SUB(CURDATE(), INTERVAL 15 DAY)),
       (2, DATE_SUB(CURDATE(), INTERVAL 13 DAY)),
       (3, DATE_SUB(CURDATE(), INTERVAL 1 MONTH));

-- 创建考上北京大学的学生的视图
create view bjuni_stu as select s.s_name,sc.sch_name from stu s left join stu_mark sm on s.s_id =sm.s_id left join sch sc on sc.sch_id = sm.sch_id where sc.sch_name='北京大学';
-- 将创建的视图更改为考上清华的学生的视图
alter view bjuni_stu as select s.s_name,sc.sch_name from stu s left join stu_mark sm on s.s_id =sm.s_id left join sch sc on sc.sch_id = sm.sch_id where sc.sch_name='清华大学';
-- 删除创建的视图。
drop view bjuni_stu;
--  创建一个存储过程用来统计表sch中的记录数,将记录数作为out输出到传入变量
drop procedure if exists counts;

CREATE PROCEDURE counts(
out counts int
)
BEGIN
DECLARE temp int;

select count(sch_id) into temp from sch;
set counts  = temp;

END;

CALL counts(@counts);
--  创建存储过程，实现 查询stu表中所有的s_id大于传入值的数据
drop procedure if exists selects;

CREATE PROCEDURE selects(
in index_id int
)
BEGIN
DECLARE temp int;

select * from stu where s_id > index_id;


END;

--  创建一个存储过程，通过调用存储函数的方法来获取表sch表中sch_id的和，作为out输出到传入变量
drop procedure if exists sum_id;

CREATE PROCEDURE sum_id(
out result_sum int
)
BEGIN
DECLARE temp int;

select sum(s_id) into temp from stu;
set result_sum = temp;


END;

--  创建存储过程，用于清理user_log，存储过程接收两个参数，
drop procedure if exists clear_log;

CREATE PROCEDURE clear_log(
in index_from int,
in index_end int
)
BEGIN

delete from user_log where log_id between index_from and index_end;


END;
--  userId 和 dayNum,根据传入的清理天数清理dayNum这些天之前的所有数据
drop procedure if exists clear_log;

CREATE PROCEDURE clear_log(
in userId int,
in dayNum date
)
BEGIN

delete from user_log where user_id=userId and  last_login<dayNum;


END;
--  如果userId不为null，则清理时userId指定的数据不能被清理掉，如果为null则仅需要根据dayNum进行清理



