--数据库初始化脚本
--创建数据库
CREATE database seckill;
--使用数据库
use seckill;
--创建秒杀库存表
CREATE TABLE seckill(
'seckill_id' bigint NOT NULL auto_increment comment '商品库存',
'name' varchar(120) NOT NULL comment '商品名称',
'number' int NOT NULL comment '库存数量',
'start_time' TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP comment '秒杀开启时间',
'end_time' TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP comment '秒杀结束时间',
'create_time' TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP comment '创建时间',
PRIMARY KEY (seckill_id),
key idx_start_time(start_time),
key idx_end_time(end_time),
key idx_create_time(create_time)
)engine=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 comment='秒杀库存表';
CREATE TABLE seckill(
seckill_id bigint NOT NULL auto_increment ,
name varchar(120) NOT NULL ,
number int NOT NULL ,
create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
start_time TIMESTAMP NOT NULL  ,
end_time TIMESTAMP NOT NULL  ,
PRIMARY KEY (seckill_id),
key idx_start_time(start_time),
key idx_end_time(end_time),
key idx_create_time(create_time)
)engine=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 ;
--初始化数据
INSERT INTO seckill(name,number,start_time,end_time)
VALUES
('1000元秒杀iPhone6',100,'2018-11-01 00:00:00','2018-11-02 00:00:00'),
('500元秒杀iPad2',200,'2018-11-01 00:00:00','2018-11-02 00:00:00'),
('300元秒杀mix2s',300,'2018-11-01 00:00:00','2018-11-02 00:00:00'),
('200元秒杀xiaomi8',400,'2018-11-01 00:00:00','2018-11-02 00:00:00');

--秒杀成功明细表
--用户登录认证相关信息
CREATE TABLE success_killed(
'seckill_id' bigint NOT NULL comment '秒杀商品id',
'user_phone' bigint NOT NULL comment '用户手机号',
'state' tinyint NOT NULL DEFAULT -1 comment '状态标识：-1表示无效，0：成功,1:已付款，2：已发货',
'create_time' TIMESTAMP NOT NULL comment '创建时间',
PRIMARY KEY (seckill_id,userphone)/*联合主键*/
KEY idx_create_time(create_time)
)engine=InnoDB DEFAULT CHARSET=utf-8 comment='秒杀成功明细表';
--连接数据库控制台 mysql -uroot -pxiang
