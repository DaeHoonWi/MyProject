package jdbc;

import java.io.IOException;
import java.io.StringReader;
import java.sql.DriverManager;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

public class DBCPInitListener implements ServletContextListener {

	public void contextInitialized(ServletContextEvent sce){
		
		String poolConfig = sce.getServletContext().getInitParameter("poolConfig");
		Properties prop = new Properties();
		
		try {
			prop.load(new StringReader(poolConfig));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException("config load fail", e);
		}
		
		loadJDBCDriver(prop);
		initConnectionPool(prop);
	}
	
	private void loadJDBCDriver(Properties prop){
		String driverClass = prop.getProperty("jdbcDriver");
		
		try {
			Class.forName(driverClass);
		} catch (ClassNotFoundException ex) {
			// TODO Auto-generated catch block
			throw new RuntimeException("fail to load JDBC Driver", ex);
		}
	}
	
	private void initConnectionPool(Properties prop){
		try {
			String jdbcUrl = prop.getProperty("jdbcUrl");
			String username = prop.getProperty("dbUser");
			String pw = prop.getProperty("dbPass");

			ConnectionFactory connFactory = new DriverManagerConnectionFactory(jdbcUrl, username, pw);

			PoolableConnectionFactory poolableConnFactory = new PoolableConnectionFactory(connFactory, null);
			String validationQuery = prop.getProperty("validationQuery"); 	// 3.커넥션 풀의 검사 쿼리
			if (validationQuery != null && !validationQuery.isEmpty()) { 	// 3.
				poolableConnFactory.setValidationQuery(validationQuery); 	// 3.
			} 																// 3.
			GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
			poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L);
			poolConfig.setTestWhileIdle(true);
			int minIdle = getIntProperty(prop, "minIdle", 5); 	// 1.최소 유휴 커넥션 설정
			poolConfig.setMinIdle(minIdle); 					// 1.
			int maxTotal = getIntProperty(prop, "maxTotal", 50);// 2.최대크기
			poolConfig.setMaxTotal(maxTotal); 					// 2.

			GenericObjectPool<PoolableConnection> connectionPool = new GenericObjectPool<>(poolableConnFactory, poolConfig);
			poolableConnFactory.setPool(connectionPool);

			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = (PoolingDriver)DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			String poolName = prop.getProperty("poolName");
			driver.registerPool(poolName, connectionPool);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	private int getIntProperty(Properties prop, String propName, int defaultValue) {
		String value = prop.getProperty(propName);
		if(value == null)return defaultValue;
		return Integer.parseInt(value);
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
	}
}
