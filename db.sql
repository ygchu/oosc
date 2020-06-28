-- 创建数据库
CREATE DATABASE oosc;

-- 切换数据库
USE oosc;

-- 创建数据表
CREATE TABLE t_customer ( NAME VARCHAR ( 20 ) PRIMARY KEY, PASSWORD VARCHAR ( 20 ) NOT NULL );
CREATE TABLE t_provider ( NAME VARCHAR ( 20 ) PRIMARY KEY, PASSWORD VARCHAR ( 20 ) NOT NULL );
CREATE TABLE t_manager ( NAME VARCHAR ( 20 ) PRIMARY KEY, PASSWORD VARCHAR ( 20 ) NOT NULL );
CREATE TABLE t_goods (
	gname VARCHAR ( 20 ),
	pname VARCHAR ( 20 ),
	price DOUBLE NOT NULL,
	description VARCHAR ( 40 ) NOT NULL,
	PRIMARY KEY ( gname, pname ),
	FOREIGN KEY ( pname ) REFERENCES t_provider ( NAME ) ON UPDATE CASCADE ON DELETE CASCADE 
);
CREATE TABLE t_cart (
	cname VARCHAR ( 20 ),
	pname VARCHAR ( 20 ),
	gname VARCHAR ( 20 ),
	amount INT NOT NULL,
	PRIMARY KEY ( cname, pname, gname ),
	FOREIGN KEY ( cname ) REFERENCES t_customer ( NAME ) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY ( pname ) REFERENCES t_provider ( NAME ) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY ( gname ) REFERENCES t_goods ( gname ) ON UPDATE CASCADE ON DELETE CASCADE 
);
CREATE TABLE t_order (
	id INT PRIMARY KEY AUTO_INCREMENT,
	cname VARCHAR ( 20 ) NOT NULL,
	pname VARCHAR ( 20 ) NOT NULL,
	gname VARCHAR ( 20 ) NOT NULL,
	price DOUBLE NOT NULL,-- 历史单价
	amount INT NOT NULL,
	total DOUBLE NOT NULL,-- 总价，可能有打折信息
date DATE NOT NULL 
);