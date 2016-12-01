
create table table_name(
 id int primary key,
 col1 char(2),
 col2 char(2),
 col3 int
);

insert into table_name values
(1 ,'A1','B1',9),
(2 ,'A2','B1',7),
(3 ,'A3','B1',4),
(4 ,'A4','B1',2),
(5 ,'A1','B2',2),
(6 ,'A2','B2',9),
(7 ,'A3','B2',8),
(8 ,'A4','B2',5),
(9 ,'A1','B3',1),
(10 ,'A2','B3',8),
(11 ,'A3','B3',8),
(12 ,'A4','B3',6),
(13 ,'A1','B4',8),
(14 ,'A2','B4',2),
(15 ,'A3','B4',6),
(16 ,'A4','B4',9),
(17 ,'A1','B4',3),
(18 ,'A2','B4',5),
(19 ,'A3','B4',2),
(20 ,'A4','B4',5);


SET @EE='';
SELECT @EE:=CONCAT(@EE,'SUM(IF(col2=\'',col2,'\'',',col3,0)) AS ',col2,',') FROM (SELECT DISTINCT col2 FROM table_name) A;
SET @QQ=CONCAT('SELECT ifnull(col1,\'total\') AS columnA,',LEFT(@EE,LENGTH(@EE)-1),' ,SUM(col3) AS TOTAL FROM table_name GROUP BY col1 WITH ROLLUP');
PREPARE stmt2 FROM @QQ;
EXECUTE stmt2;


select * from table_name where col1='A2';

select * from(
select t.col1,
	max(case when col2='B1' then col3 else '' end) as c2,
	max(case when col2='B2' then col3 else '' end) as c3,
	max(case when col2='B3' then col3 else '' end) as c4,
	max(case when col2='B4' then col3 else '' end) as c5
 #,t.*
 from table_name t GROUP BY col1 ) tmp 
 ;
