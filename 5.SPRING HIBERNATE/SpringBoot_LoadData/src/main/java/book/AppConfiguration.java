package book;

import java.io.IOException;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;

@Configuration
public class AppConfiguration {
	@Autowired
	private Environment env;
	
	@Bean(name = "dataSource")
	public DataSource getDataSource() {
		DriverManagerDataSource source = new DriverManagerDataSource();
		source.setDriverClassName(env.getProperty("spring.datasource.driver-class-name"));
		source.setUrl(env.getProperty("spring.datasource.url"));
		source.setUsername(env.getProperty("spring.datasource.username"));
		source.setPassword(env.getProperty("spring.datasource.password"));
		return source;
	}
	
	@Bean(name = "sessionFactory")
	public SessionFactory getSessionFactory() {
		LocalSessionFactoryBean sf = new LocalSessionFactoryBean();
		sf.setDataSource(getDataSource());
		sf.setPackagesToScan("book.entities");
		Properties prop = new Properties();
		prop.put("hibernate.show_sql", env.getProperty("spring.jpa.hibernate.properties.show_sql"));
		prop.put("hibernate.dialect", env.getProperty("spring.jpa.hibernate.properties.dialect"));
		sf.setHibernateProperties(prop);
		try {
			sf.afterPropertiesSet();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sf.getObject();
	}
}
