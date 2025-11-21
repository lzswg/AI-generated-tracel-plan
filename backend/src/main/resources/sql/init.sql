-- 创建数据库
CREATE DATABASE IF NOT EXISTS travel_plan DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE travel_plan;

-- 用户表
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `role` int DEFAULT '0' COMMENT '角色 0-普通用户 1-管理员',
  `status` int DEFAULT '1' COMMENT '状态 0-禁用 1-启用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`),
  UNIQUE KEY `uk_phone` (`phone`),
  UNIQUE KEY `uk_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

-- 插入测试用户数据
-- 密码都是 123456
INSERT INTO `sys_user` (`username`, `password`, `nickname`, `phone`, `email`, `role`, `status`) VALUES
('user01', '$2a$10$rJ3qYQK7XxXxXxXxXxXxXu0Z4L4Z4L4Z4L4Z4L4Z4L4Z4L4Z4L4Z4K', '旅行爱好者小王', '13800138001', 'user01@example.com', 0, 1),
('admin', '$2a$10$rJ3qYQK7XxXxXxXxXxXxXu0Z4L4Z4L4Z4L4Z4L4Z4L4Z4L4Z4L4Z4K', '系统管理员', '13800138000', 'admin@example.com', 1, 1);

