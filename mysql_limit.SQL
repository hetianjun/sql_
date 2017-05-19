
Mysql limit  分页优化

#----	2004906
SELECT count(1) from t_score;

#----	407818
SELECT count(1) from t_user;

#----	14798
SELECT count(1) from t_vip_person;


#----limit 数据量一大的时候,limit的性能就急剧下降
#during query
select c.cellPhone,hp.ac_name,b.* from t_score b 
	LEFT JOIN t_user c on c.id=b.userId
	LEFT JOIN t_vip_person hp on hp.user_id=b.userId
	#INNER JOIN ( select id from t_score order by id desc limit 2000800,100 )tmp on tmp.id = b.id
	order by id desc limit 2000800,100;

#----Query Time 1.985S
select c.cellPhone,hp.ac_name,b.* from t_score b 
	LEFT JOIN t_user c on c.id=b.userId
	LEFT JOIN t_vip_person hp on hp.user_id=b.userId
	INNER JOIN ( select id from t_score order by id desc limit 2000800,100 )tmp on tmp.id = b.id
	order by id desc #limit 2000800,100;
