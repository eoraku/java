/* listNews */
select num, name, title, nvl(svrfile2,0) svrfile2, substr(content,1,120) content
		, substr(ldate,1,4)||'-'||substr(ldate,5,2)||'-'||substr(ldate,7,2) ldate, group_flag 
	from (
		select a.*,rownum linenum from (
			select num, name, title, svrfile2, ldate, group_flag, content
				from jctv_news2 
				where web_view='1'
				order by ldate desc, num desc) a
			where rownum<=20
		) where linenum>=1;

/* indexNewsHot */
select * from (
	select num,name,title,substr(content,1,20) content,svrfile2,ldate,group_flag,hot_flag,news_hit 
		from jctv_news2 
		where ldate >= to_char(sysdate-7,'YYYYMMDD') and web_view='1' 
			and eng is null and chi is null and hot_flag='1' and svrfile2 is not null 
		order by ldate desc,num desc 
	) where rownum<=5;

/* indexNewsTop0 */
select * from ( 
	select num, title, group_flag 
		from jctv_news2 
		where ldate >= to_char(sysdate-7,'YYYYMMDD') and web_view='1' 
			and eng is null and chi is null and news_hit is not null 
		order by news_hit desc 
	) where rownum<=8;

/* indexNewsTop1 */
select * from ( 
	select num, title, group_flag 
		from jctv_news2 
		where ldate >= to_char(sysdate-7,'YYYYMMDD') and web_view='1' and group_flag in ('1','5') 
			and eng is null and chi is null and news_hit is not null 
		order by news_hit desc 
	) where rownum<=8;

/* indexNewsTop2 */
select * from ( 
	select num, title, group_flag 
		from jctv_news2 
		where ldate >= to_char(sysdate-7,'YYYYMMDD') and web_view='1' and group_flag in ('2','6') 
			and eng is null and chi is null and news_hit is not null 
		order by news_hit desc 
	) where rownum<=8;

/* indexNewsTop3 */
select * from ( 
	select num, title, group_flag 
		from jctv_news2 
		where ldate >= to_char(sysdate-7,'YYYYMMDD') and web_view='1' and group_flag in ('3','7') 
			and eng is null and chi is null and news_hit is not null 
		order by news_hit desc 
	) where rownum<=8;

/* indexNewsTo4 */
select * from ( 
	select num, title, group_flag 
		from jctv_news2 
		where ldate >= to_char(sysdate-7,'YYYYMMDD') and web_view='1' and group_flag in ('4','8') 
			and eng is null and chi is null and news_hit is not null 
		order by news_hit desc 
	) where rownum<=8;

/* indexNewsGroup1 */
select num, name, title, substr(content,1,120) content, nvl(svrfile2,0) svrfile2 from ( 
	select num, name, title, content, svrfile2 
		from jctv_news2 
		where ldate >= to_char(sysdate-7,'YYYYMMDD') and web_view='1' and group_flag in ('1','5') 
			and eng is null and chi is null 
		order by ldate desc, num desc 
	) where rownum<=3;

/* indexNewsGroup2 */
select num, name, title, substr(content,1,120) content, nvl(svrfile2,0) svrfile2 from ( 
	select num, name, title, content, svrfile2 
		from jctv_news2 
		where ldate >= to_char(sysdate-7,'YYYYMMDD') and web_view='1' and group_flag in ('2','6') 
			and eng is null and chi is null 
		order by ldate desc, num desc 
	) where rownum<=3;

/* indexNewsGroup3 */
select num, name, title, substr(content,1,120) content, nvl(svrfile2,0) svrfile2 from ( 
	select num, name, title, content, svrfile2 
		from jctv_news2 
		where ldate >= to_char(sysdate-7,'YYYYMMDD') and web_view='1' and group_flag in ('3','7') 
			and eng is null and chi is null 
		order by ldate desc, num desc 
	) where rownum<=3;

/* indexNewsGroup4 */
select num, name, title, substr(content,1,120) content, nvl(svrfile2,0) svrfile2 from ( 
	select num, name, title, content, svrfile2 
		from jctv_news2 
		where ldate >= to_char(sysdate-7,'YYYYMMDD') and web_view='1' and group_flag in ('4','8') 
			and eng is null and chi is null 
		order by ldate desc, num desc 
	) where rownum<=3;

/* getWeatherFlv */
select * from (
	select num,name,title,nvl(svrfile2,0) svrfile2,flv,ldate 
		from jctv_news2 
		where ldate >= to_char(sysdate-2,'YYYYMMDD') and web_view='1' and group_flag='3' 
			and flv is not null 
		order by ldate desc,num desc
	) where rownum<=1;

/* indexInvite */
select * from (
	select num, subcd, title, urlfile, vodcode, photo_url 
		from vodlist 
		where subcd='0501' and web_view='1' 
		order by firstdt desc
	) where rownum<=3;