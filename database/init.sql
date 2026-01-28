-- Industrial Equipment Trading Platform Database Schema
-- Created: 2026-01-28
-- Database: MySQL 8.0

-- Drop existing database if exists
DROP DATABASE IF EXISTS industrial_trading;
CREATE DATABASE industrial_trading DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE industrial_trading;

-- Table: admin (管理员表)
CREATE TABLE `admin` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `username` VARCHAR(50) NOT NULL COMMENT '用户名',
  `password` VARCHAR(50) NOT NULL COMMENT '密码(MD5加密)',
  `realname` VARCHAR(50) DEFAULT NULL COMMENT '真实姓名',
  `phone` VARCHAR(20) DEFAULT NULL COMMENT '联系电话',
  `email` VARCHAR(100) DEFAULT NULL COMMENT '邮箱',
  `status` TINYINT(1) DEFAULT 1 COMMENT '状态(1:正常 0:禁用)',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

-- Table: user (用户表)
CREATE TABLE `user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` VARCHAR(50) NOT NULL COMMENT '用户名',
  `password` VARCHAR(50) NOT NULL COMMENT '密码(MD5加密)',
  `realname` VARCHAR(50) NOT NULL COMMENT '真实姓名',
  `phone` VARCHAR(20) NOT NULL COMMENT '联系电话',
  `email` VARCHAR(100) DEFAULT NULL COMMENT '邮箱',
  `id_card` VARCHAR(18) DEFAULT NULL COMMENT '身份证号',
  `user_type` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '用户类型(1:买家 2:卖家)',
  `company_name` VARCHAR(200) DEFAULT NULL COMMENT '公司名称(卖家)',
  `company_address` VARCHAR(500) DEFAULT NULL COMMENT '公司地址(卖家)',
  `business_license` VARCHAR(200) DEFAULT NULL COMMENT '营业执照路径(卖家)',
  `status` TINYINT(1) DEFAULT 0 COMMENT '状态(0:待审核 1:正常 2:禁用)',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`),
  KEY `idx_user_type` (`user_type`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- Table: category (商品分类表)
CREATE TABLE `category` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` VARCHAR(100) NOT NULL COMMENT '分类名称',
  `description` VARCHAR(500) DEFAULT NULL COMMENT '分类描述',
  `parent_id` INT(11) DEFAULT 0 COMMENT '父分类ID(0为顶级分类)',
  `sort_order` INT(11) DEFAULT 0 COMMENT '排序',
  `status` TINYINT(1) DEFAULT 1 COMMENT '状态(1:启用 0:禁用)',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品分类表';

-- Table: product (商品表)
CREATE TABLE `product` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `name` VARCHAR(200) NOT NULL COMMENT '商品名称',
  `category_id` INT(11) NOT NULL COMMENT '分类ID',
  `seller_id` INT(11) NOT NULL COMMENT '卖家ID',
  `price` DECIMAL(10,2) NOT NULL COMMENT '价格',
  `unit` VARCHAR(20) DEFAULT '台' COMMENT '单位',
  `stock` INT(11) DEFAULT 1 COMMENT '库存',
  `brand` VARCHAR(100) DEFAULT NULL COMMENT '品牌',
  `model` VARCHAR(100) DEFAULT NULL COMMENT '型号',
  `specifications` TEXT COMMENT '规格参数',
  `description` TEXT COMMENT '商品描述',
  `main_image` VARCHAR(200) DEFAULT NULL COMMENT '主图路径',
  `images` TEXT COMMENT '商品图片(多张,逗号分隔)',
  `status` TINYINT(1) DEFAULT 0 COMMENT '状态(0:待审核 1:已上架 2:已下架 3:审核拒绝)',
  `sales` INT(11) DEFAULT 0 COMMENT '销量',
  `views` INT(11) DEFAULT 0 COMMENT '浏览量',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_category_id` (`category_id`),
  KEY `idx_seller_id` (`seller_id`),
  KEY `idx_status` (`status`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品表';

-- Table: order (订单表)
CREATE TABLE `order` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_no` VARCHAR(50) NOT NULL COMMENT '订单号',
  `buyer_id` INT(11) NOT NULL COMMENT '买家ID',
  `seller_id` INT(11) NOT NULL COMMENT '卖家ID',
  `product_id` INT(11) NOT NULL COMMENT '商品ID',
  `product_name` VARCHAR(200) NOT NULL COMMENT '商品名称',
  `product_image` VARCHAR(200) DEFAULT NULL COMMENT '商品图片',
  `price` DECIMAL(10,2) NOT NULL COMMENT '商品单价',
  `quantity` INT(11) NOT NULL DEFAULT 1 COMMENT '购买数量',
  `total_amount` DECIMAL(10,2) NOT NULL COMMENT '订单总额',
  `receiver_name` VARCHAR(50) NOT NULL COMMENT '收货人姓名',
  `receiver_phone` VARCHAR(20) NOT NULL COMMENT '收货人电话',
  `receiver_address` VARCHAR(500) NOT NULL COMMENT '收货地址',
  `remark` VARCHAR(500) DEFAULT NULL COMMENT '备注',
  `status` TINYINT(1) DEFAULT 1 COMMENT '订单状态(1:待发货 2:已发货 3:已完成 4:已取消)',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `pay_time` DATETIME DEFAULT NULL COMMENT '支付时间',
  `ship_time` DATETIME DEFAULT NULL COMMENT '发货时间',
  `finish_time` DATETIME DEFAULT NULL COMMENT '完成时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_order_no` (`order_no`),
  KEY `idx_buyer_id` (`buyer_id`),
  KEY `idx_seller_id` (`seller_id`),
  KEY `idx_status` (`status`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- Table: logistics (物流表)
CREATE TABLE `logistics` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '物流ID',
  `order_id` INT(11) NOT NULL COMMENT '订单ID',
  `order_no` VARCHAR(50) NOT NULL COMMENT '订单号',
  `logistics_company` VARCHAR(100) NOT NULL COMMENT '物流公司',
  `logistics_no` VARCHAR(50) NOT NULL COMMENT '物流单号',
  `sender_name` VARCHAR(50) NOT NULL COMMENT '发货人姓名',
  `sender_phone` VARCHAR(20) NOT NULL COMMENT '发货人电话',
  `sender_address` VARCHAR(500) NOT NULL COMMENT '发货地址',
  `receiver_name` VARCHAR(50) NOT NULL COMMENT '收货人姓名',
  `receiver_phone` VARCHAR(20) NOT NULL COMMENT '收货人电话',
  `receiver_address` VARCHAR(500) NOT NULL COMMENT '收货地址',
  `status` TINYINT(1) DEFAULT 1 COMMENT '物流状态(1:待揽件 2:运输中 3:派送中 4:已签收)',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_order_id` (`order_id`),
  KEY `idx_order_no` (`order_no`),
  KEY `idx_logistics_no` (`logistics_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='物流表';

-- Table: logistics_track (物流跟踪记录表)
CREATE TABLE `logistics_track` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '跟踪记录ID',
  `logistics_id` INT(11) NOT NULL COMMENT '物流ID',
  `content` VARCHAR(500) NOT NULL COMMENT '跟踪内容',
  `location` VARCHAR(200) DEFAULT NULL COMMENT '当前位置',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  PRIMARY KEY (`id`),
  KEY `idx_logistics_id` (`logistics_id`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='物流跟踪记录表';

-- Table: report (异常举报表)
CREATE TABLE `report` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '举报ID',
  `user_id` INT(11) NOT NULL COMMENT '举报人ID',
  `order_id` INT(11) DEFAULT NULL COMMENT '订单ID',
  `product_id` INT(11) DEFAULT NULL COMMENT '商品ID',
  `report_type` TINYINT(1) NOT NULL COMMENT '举报类型(1:商品异常 2:卖家异常 3:物流异常 4:其他)',
  `title` VARCHAR(200) NOT NULL COMMENT '举报标题',
  `content` TEXT NOT NULL COMMENT '举报内容',
  `images` TEXT DEFAULT NULL COMMENT '证据图片(多张,逗号分隔)',
  `status` TINYINT(1) DEFAULT 1 COMMENT '状态(1:待处理 2:处理中 3:已处理 4:已关闭)',
  `admin_reply` TEXT DEFAULT NULL COMMENT '管理员回复',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `handle_time` DATETIME DEFAULT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_status` (`status`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='异常举报表';

-- Insert default admin account (username: admin, password: admin123 => MD5: 0192023a7bbd73250516f069df18b500)
INSERT INTO `admin` (`username`, `password`, `realname`, `phone`, `email`, `status`) VALUES
('admin', '0192023a7bbd73250516f069df18b500', '系统管理员', '13800138000', 'admin@industrial.com', 1);

-- Insert default categories
INSERT INTO `category` (`name`, `description`, `parent_id`, `sort_order`, `status`) VALUES
('工程机械', '挖掘机、装载机、推土机等工程机械设备', 0, 1, 1),
('机床设备', '数控机床、车床、铣床等机床设备', 0, 2, 1),
('电力设备', '发电机、变压器、配电柜等电力设备', 0, 3, 1),
('化工设备', '反应釜、蒸馏塔、换热器等化工设备', 0, 4, 1),
('矿山设备', '破碎机、球磨机、选矿设备等矿山机械', 0, 5, 1);

-- Insert sample users for testing (password: 123456 => MD5: e10adc3949ba59abbe56e057f20f883e)
INSERT INTO `user` (`username`, `password`, `realname`, `phone`, `email`, `user_type`, `company_name`, `status`) VALUES
('buyer001', 'e10adc3949ba59abbe56e057f20f883e', '张三', '13900139001', 'buyer001@example.com', 1, NULL, 1),
('seller001', 'e10adc3949ba59abbe56e057f20f883e', '李四', '13900139002', 'seller001@example.com', 2, '重工机械有限公司', 1);

-- Insert sample product for testing
INSERT INTO `product` (`name`, `category_id`, `seller_id`, `price`, `unit`, `stock`, `brand`, `model`, `specifications`, `description`, `status`) VALUES
('二手挖掘机', 1, 2, 280000.00, '台', 5, '卡特彼勒', 'CAT320D', '额定功率:121kW, 斗容:1.2m³, 工作质量:21吨', '进口卡特彼勒挖掘机，成色新，性能优良，适用于各类工程项目。', 1);

COMMIT;
