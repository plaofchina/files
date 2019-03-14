--ludp_aws_db 库
  --建库语句
   create database hybrid_db;
  
  --表设计
    --表名:sys_pf
	  --本表字段如下
		--主键:pl_id 递增 
	    --平台:platform
  --建表语句
    create table sys_pf(
        pl_id int primary key auto_increment,
		platform  varchar(128)
		);
		
  --表设计
    --表名:conn
	  --本表字段如下
		--主键:conn_id 递增 
	    --关联conn表:pl_id
		--连接地址和端口:url
		--标签:lable
		--库类型:db_type
        --描述:description
  --建表语句
    create table conn(
	    conn_id int primary key auto_increment,
		pl_id int,
		url varchar(128),
		lable varchar(128),
		db_type varchar(128),
		descrip varchar(128)
		);
	
		
  --表设计
    --表名:dbs
	  --本表字段如下
		--主键:db_id 递增 
	    --和conn关联:conn_id
		--库名:db_name
		--描述:descrip
  --建表语句
    create table dbs(
	    db_id int primary key auto_increment,
	    conn_id  int ,
		db_name varchar(128),
        descrip varchar(128)		
		);
		

  --表设计
    --表名:tbls
	  --表字段如下
	    --自增键:tb_id 为unique 递增
		--关联conn_db的列:db_id
        --获取的表id:pre_id 
        --获取的表名:tbl_name
		--表类型:tbl_type
		--描述:descrip
		--db_id和pre_id组成联合主键
  --建表语句
    create table tbls(
	    tbl_id int not null unique key auto_increment,
		db_id int ,
		tbl_name varchar(128),
		tbl_type varchar(128),
		descrip varchar(128),
		primary key (db_id , tbl_name)
		);
 
  --表设计
    --表名:columns_v3
	  --表字段如下
	    --tbl的自增键:tbl_id
		--获取的字段名:col_name
		--获取的字段类型:col_type
		--字段顺序:col_num
		--描述:descrip
		--tbl_id和col_name为联合主键
 --建表语句
    create table cols(
	    tbl_id int ,
		col_name varchar(128),
		col_type varchar(128),
		col_num int ,
		descrip varchar(128),
		primary key (tbl_id , col_name)
		);
		
  
  
  
  
  
    select td.db_name , td.tbl_name,c.col_name,c.col_type,c.col_num from  ( select d.conn_id, d.db_name,t.tbl_name, tbl_id from dbs d join tbls t  on t.db_id =d.db_id and conn_id = ?) as td  join cols c on td.tbl_id= c.tbl_id;
  
  
  SELECT DBS.NAME db_name ,TC.TBL_NAME tbl_name ,TC.COLUMN_NAME col_name, TC.TYPE_NAME  col_type , TC.INTEGER_IDX col_num from DBS JOIN (SELECT TBLS.DB_ID,TBLS.TBL_ID,TBLS.TBL_NAME,COL.COLUMN_NAME,COL.TYPE_NAME ,COL.INTEGER_IDX FROM TBLS JOIN (SELECT COLUMNS_V2.COLUMN_NAME, COLUMNS_V2.TYPE_NAME,COLUMNS_V2.INTEGER_IDX ,SDS.SD_ID FROM COLUMNS_V2 JOIN SDS  on COLUMNS_V2.CD_ID=SDS.CD_ID) AS COL ON COL.SD_ID=TBLS.SD_ID) AS TC ON DBS.DB_ID=TC.DB_ID
  
  
  
  
  
  
  
  
  
  
  
  