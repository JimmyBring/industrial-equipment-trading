# 工业设备交易平台

基于SSM（Spring + SpringMVC + MyBatis）框架开发的B2B工业设备交易系统

## 项目介绍

工业设备交易平台是一个专业的B2B电子商务平台，主要面向工业设备的买卖双方，提供设备发布、浏览、交易、物流跟踪等完整的交易流程支持。

## 功能特性

### 用户端功能
- **用户注册登录**：支持买家和卖家注册，需管理员审核
- **商品浏览**：按分类浏览商品，支持关键词搜索
- **商品发布**：卖家可发布商品信息，需管理员审核
- **下单购买**：买家可下单购买商品，填写收货信息
- **订单管理**：查看购买订单和销售订单
- **物流跟踪**：查看订单物流信息和跟踪记录
- **异常举报**：对商品、卖家、物流等进行举报

### 管理端功能
- **用户管理**：审核用户注册、禁用用户
- **商品管理**：审核商品发布、商品下架
- **举报管理**：处理用户举报、回复举报内容

## 技术栈

### 后端技术
- **Spring 5.3.20**：IoC容器和AOP支持
- **Spring MVC 5.3.20**：MVC框架
- **MyBatis 3.5.10**：持久层框架
- **MySQL 8.0**：关系型数据库
- **Druid 1.2.11**：数据库连接池
- **Jackson 2.13.3**：JSON处理
- **Log4j 1.2.17**：日志框架

### 前端技术
- **Bootstrap 3.3.7**：UI框架
- **jQuery 1.11.3**：JavaScript库
- **JSP + JSTL**：视图技术

## 环境要求

- **JDK**：1.8+
- **Maven**：3.6+
- **MySQL**：8.0+
- **Tomcat**：8.5+ 或 9.0+

## 安装步骤

### 1. 克隆项目
```bash
git clone https://github.com/JimmyBring/industrial-equipment-trading.git
cd industrial-equipment-trading
```

### 2. 创建数据库
```bash
mysql -u root -p
source database/init.sql
```

### 3. 配置数据库连接
编辑 `src/main/resources/jdbc.properties`，修改数据库连接信息：
```properties
jdbc.url=jdbc:mysql://localhost:3306/industrial_trading?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai
jdbc.username=root
jdbc.password=your_password
```

### 4. 编译项目
```bash
mvn clean package
```

### 5. 部署到Tomcat
将生成的 `target/industrial-trading.war` 部署到Tomcat的webapps目录

### 6. 启动Tomcat
```bash
# Linux/Mac
$TOMCAT_HOME/bin/startup.sh

# Windows
%TOMCAT_HOME%\bin\startup.bat
```

### 7. 访问系统
- 前台地址：http://localhost:8080/industrial-trading/
- 管理后台：http://localhost:8080/industrial-trading/admin/login

## 默认账号

### 管理员账号
- 用户名：`admin`
- 密码：`admin123`

### 测试用户
- 买家：`buyer001` / `123456`
- 卖家：`seller001` / `123456`

## 项目结构

```
industrial-equipment-trading/
├── database/                    # 数据库脚本
│   └── init.sql                # 初始化脚本
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/industrial/trading/
│   │   │       ├── controller/      # 控制器层
│   │   │       │   ├── admin/      # 管理员控制器
│   │   │       │   ├── IndexController.java
│   │   │       │   ├── UserController.java
│   │   │       │   ├── ProductController.java
│   │   │       │   ├── OrderController.java
│   │   │       │   ├── LogisticsController.java
│   │   │       │   └── ReportController.java
│   │   │       ├── service/         # 服务层
│   │   │       │   ├── impl/       # 服务实现
│   │   │       │   ├── UserService.java
│   │   │       │   ├── ProductService.java
│   │   │       │   ├── OrderService.java
│   │   │       │   ├── LogisticsService.java
│   │   │       │   ├── ReportService.java
│   │   │       │   └── CategoryService.java
│   │   │       ├── dao/            # 数据访问层
│   │   │       │   ├── UserMapper.java
│   │   │       │   ├── ProductMapper.java
│   │   │       │   ├── OrderMapper.java
│   │   │       │   ├── LogisticsMapper.java
│   │   │       │   ├── LogisticsTrackMapper.java
│   │   │       │   ├── ReportMapper.java
│   │   │       │   ├── CategoryMapper.java
│   │   │       │   └── AdminMapper.java
│   │   │       ├── entity/         # 实体类
│   │   │       │   ├── User.java
│   │   │       │   ├── Product.java
│   │   │       │   ├── Order.java
│   │   │       │   ├── Logistics.java
│   │   │       │   ├── LogisticsTrack.java
│   │   │       │   ├── Report.java
│   │   │       │   ├── Category.java
│   │   │       │   └── Admin.java
│   │   │       ├── util/           # 工具类
│   │   │       │   ├── MD5Util.java
│   │   │       │   └── ResultUtil.java
│   │   │       └── interceptor/    # 拦截器
│   │   │           ├── LoginInterceptor.java
│   │   │           └── AdminInterceptor.java
│   │   ├── resources/
│   │   │   ├── mapper/             # MyBatis映射文件
│   │   │   │   ├── UserMapper.xml
│   │   │   │   ├── ProductMapper.xml
│   │   │   │   ├── OrderMapper.xml
│   │   │   │   ├── LogisticsMapper.xml
│   │   │   │   ├── LogisticsTrackMapper.xml
│   │   │   │   ├── ReportMapper.xml
│   │   │   │   ├── CategoryMapper.xml
│   │   │   │   └── AdminMapper.xml
│   │   │   ├── spring/             # Spring配置文件
│   │   │   │   ├── applicationContext.xml
│   │   │   │   ├── spring-mvc.xml
│   │   │   │   └── spring-mybatis.xml
│   │   │   ├── jdbc.properties     # 数据库配置
│   │   │   └── log4j.properties    # 日志配置
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       │   ├── views/          # JSP页面
│   │       │   │   ├── common/     # 公共页面
│   │       │   │   ├── user/       # 用户页面
│   │       │   │   ├── product/    # 商品页面
│   │       │   │   ├── order/      # 订单页面
│   │       │   │   ├── logistics/  # 物流页面
│   │       │   │   ├── report/     # 举报页面
│   │       │   │   ├── admin/      # 管理页面
│   │       │   │   └── index.jsp   # 首页
│   │       │   └── web.xml         # Web配置
│   │       └── static/             # 静态资源
│   │           ├── css/
│   │           └── js/
│   └── test/                       # 测试代码
└── pom.xml                         # Maven配置
```

## 数据库设计

### 核心数据表
1. **user** - 用户表（买家和卖家）
2. **admin** - 管理员表
3. **category** - 商品分类表
4. **product** - 商品表
5. **order** - 订单表
6. **logistics** - 物流表
7. **logistics_track** - 物流跟踪记录表
8. **report** - 异常举报表

## 系统截图

（待补充）

## 开发计划

- [x] 数据库设计和初始化
- [x] 实体类开发
- [x] Mapper接口和XML映射
- [x] Service服务层开发
- [x] Controller控制器开发
- [x] JSP页面开发
- [x] 系统配置和部署
- [ ] 单元测试完善
- [ ] 性能优化
- [ ] 安全加固

## 贡献指南

欢迎提交Issue和Pull Request来帮助改进项目。

## 许可证

MIT License

## 联系方式

如有问题，请通过GitHub Issues联系。
