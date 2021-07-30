# JDBC 

JDBC(Java Database Connectivity)，本质上属于一种服务，服务的特征，必须按照指定的规范进行操作。

JDBC作为一种数据库连接技术，能实现Java程序对各种数据库的访问。由一组使用Java语言编写的类和接口（JDBC API）组成，他们位于java.sql以及javax.sql中。



**作用:**

1. 与数据库建立联系.

2. 将编写好的SQL语句发送至数据库执行

3. 对数据库返回的结果进行操作



**JDBC API**

- java.sql.*
- javax.sql.*

 **连接数据库相关的:**

  **DriverManager**：

　　 用URL连接数据库，在4.0版本之前要进行加载，即用映射加载驱动 Class.forName("com.mysql.jdbc.Driver");

  [**DataSource** ](https://blog.csdn.net/qq_40910541/article/details/80771607) 

　　 相对于DriverManager类,DataSource更适合用于获取操作数据的Connection对象,

　　 它相对灵活,并且支持 JNDI ,可以为servlet容器提供连接池 

  **Connection接口**：

　　 负责连接数据库并担任传送数据的任务。

 **数据库SQL相关的:**

  **Statement接口**：

　　负责执行SQL语句。

- **PreparedStatement**: 预编译,可以让SQL拥有参数,防止SQL注入
- **CallableStatement**: 可以Statement基础上执行存储过程

  **ResultSet接口**：

　　负责保存Statement执行后所产生的查询结果。

  **RowSet接口:**

　　**RowSet 比 ResultSet 功能更多,更易使用,**所有的RowSet对象都继承于 ResultSet.







# 相关概念

> 核心包java.sql
> DriverManager
> Connection
> Statement
> PreparedStatement
> ResultSet





# JDBC-Mysql实例

## JDBC处理SQL语句的过程(建表,查表)

**使用JDBC 的步骤**

-  **建立 与数据库的连接 **
-  **创建 statement**
-  **执行 Query**
-  **处理 结果集(ResultSets)**
-  **关闭 连接**



**注意：**

- **通过反射机制加载数据库驱动程序类**
- **数据库的连接需要一个网络的的连接地址**
  *地址结构：* jdbc:mysql://IP:PORT/DBNAME
- **数据库的用户名和密码**



## MySQL示例

```java
// MySQL 样例

private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
private static final String URL = "jdbc:mysql://localhost:3306/test";
static final String USER = "root";
static final String PASSWORD = "root";
//注册驱动
Class driverClass = Class.forName(DRIVER);
Driver driver = (Driver) driverClass.newInstance();
DriverManager.registerDriver(driver);
//获取连接
Connection conn = DriverManager.getConnection(URL,USER,PASSWORD);

```





# 完整示例demo

```java
package com.cupdata.JDBC;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.sql.*;

public class SimpleJdbcTest {
    static Logger logger = LoggerFactory.getLogger(SimpleJdbcTest.class);
    // JDBC driver name and database URL
    static final String DRIVER = "com.mysql.jdbc.Driver";
    static final String URL = "jdbc:mysql://192.168.17.122:3306/cruze?useSSL=false";
    static final String USER = "root";
    static final String PASSWORD = "root";

    public static void main(String[] args) {
        Connection connection = null;
        Statement statement = null;
        try {
            logger.info("STEP 1: Register JDBC driver");
            Class driverClass = Class.forName(DRIVER);
            Driver driver = (Driver) driverClass.newInstance();
            DriverManager.registerDriver(driver);
            logger.info("STEP 2:Open a connection");
            logger.info("\t\tConnecting to database...");
            connection = DriverManager.getConnection(URL, USER, PASSWORD);

            logger.info("STEP 3: Execute a query");
            logger.info("\t\tCreating statement...");
            statement = connection.createStatement();
            String sql = "SELECT id, name, age FROM panhua where name = 'wangwei'";
            ResultSet resultSet = statement.executeQuery(sql);

            logger.info("STEP 4: Extract data from result set");
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int age = resultSet.getInt("age");
                logger.info("\t\tDisplay values");
                logger.info("\t\t\tID:{} ", id);
                logger.info("\t\t\tage:{} ", age);
                logger.info("\t\t\ttname:{} ", name);
            }
            logger.info("STEP 5: Clean-up environment");
            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException se) {
            logger.info("Handle errors for JDBC");
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException se2) {
            }
            try {
                if (connection != null)
                    connection.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        System.out.println("Goodbye!");
    }
}

```





















