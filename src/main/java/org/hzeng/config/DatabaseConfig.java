package org.hzeng.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.EnvironmentAware;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import javax.sql.DataSource;

/**
 * Created by hzeng on 4/19/17.
 */
// TODO: rewrite database config
@Configuration
public class DatabaseConfig implements EnvironmentAware {

    private Environment environment;

    @Autowired
    DataSource dataSource;

    @Override
    public void setEnvironment(Environment environment) {
        this.environment = environment;
    }

    @Bean
    DataSourceTransactionManager transactionManager(){
        DataSourceTransactionManager manager = new DataSourceTransactionManager();
        manager.setDataSource(dataSource);
        return manager;
    }

    @Bean
    SqlSessionFactoryBean sqlSessionFactory(){
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(dataSource);
        bean.setConfigLocation(new ClassPathResource("mybatis-config.xml"));
        return bean;
    }

//    @Bean
//    MapperScannerConfigurer mapperScannerConfigurer(){
//        MapperScannerConfigurer configurer = new MapperScannerConfigurer();
//        String prop = environment.getProperty("spring.mapper.base-package");
//        configurer.setBasePackage(environment.getProperty("spring.mapper.base-package"));
//        configurer.setSqlSessionFactoryBeanName("sqlSessionFactory");
//        return  configurer;
//    }

    @Bean
    ThreadPoolTaskExecutor taskExecutor(){
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        executor.setCorePoolSize(10);
        executor.setMaxPoolSize(20);
        executor.setQueueCapacity(20);
        return executor;
    }

}
