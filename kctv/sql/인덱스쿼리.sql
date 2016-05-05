/* indexListHotVod */
select * from (
	select num, vodcode, title, urlfile, photo_url 
		from vodlist where firstdt >= to_char(sysdate-7,'YYYYMMDD') and web_view='1' 
		order by view_cnt desc
	) where rownum<=5;

/* indexListLatestNewsImg */
select num, name, title, svrfile2 
	from jctv_news2 
	where ldate >= to_char(sysdate-7,'YYYYMMDD') and web_view='1' and group_flag in('1','5') and svrfile2 is not null 
		and eng is null and chi is null and rownum<=1 
	order by ldate desc;

/* indexListLatestNewsImgEng */
select num, name, title, svrfile2 
	from jctv_news2 
	where ldate >= to_char(sysdate-7,'YYYYMMDD') and web_view='1' and svrfile2 is not null 
		and eng is not null and chi is null and rownum<=1 
	order by ldate desc;

/* indexListLatestNewsImgChi */
select num, name, title, svrfile2 
	from jctv_news2 
	where ldate >= to_char(sysdate-7,'YYYYMMDD') and web_view='1' and svrfile2 is not null 
		and eng is null and chi is not null and rownum<=1 
	order by ldate desc;

/* indexListLatestNews */
select num, name, title, '' svrfile2 
	from jctv_news2 
	where ldate >= to_char(sysdate-7,'YYYYMMDD') and web_view='1' and group_flag in ('1','5') and svrfile2 is null 
		and eng is null and chi is null and rownum<=5 
	order by ldate desc;

/* indexListLatestNewsEng */
select num, name, title, '' svrfile2 
	from jctv_news2 
	where ldate >= to_char(sysdate-7,'YYYYMMDD') and web_view='1' and svrfile2 is null 
		and eng is not null and chi is null and rownum<=5 
	order by ldate desc;

/* indexListLatestNewsChi */
select num, name, title, '' svrfile2 
	from jctv_news2 
	where ldate >= to_char(sysdate-7,'YYYYMMDD') and web_view='1' and svrfile2 is null 
		and eng is null and chi is not null and rownum<=5 
	order by ldate desc;