package com.example.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import redis.clients.jedis.JedisPoolConfig;

/**
 * Created by hzeng on 4/18/17.
 */
@Configuration
@ConfigurationProperties("spring.redis.pool")
public class JedisConfig {

    private static JedisPoolConfig config;

    int maxTotal;
    int maxIdle;
    int minIdle;
    int maxWaitMillis;
    boolean testOnBorrow;
    boolean testOnReturn;

    public int getMaxTotal() {
        return maxTotal;
    }

    public void setMaxTotal(int maxTotal) {
        this.maxTotal = maxTotal;
    }

    public int getMaxIdle() {
        return maxIdle;
    }

    public void setMaxIdle(int maxIdle) {
        this.maxIdle = maxIdle;
    }

    public int getMinIdle() {
        return minIdle;
    }

    public void setMinIdle(int minIdle) {
        this.minIdle = minIdle;
    }

    public int getMaxWaitMillis() {
        return maxWaitMillis;
    }

    public void setMaxWaitMillis(int maxWaitMillis) {
        this.maxWaitMillis = maxWaitMillis;
    }

    public boolean isTestOnBorrow() {
        return testOnBorrow;
    }

    public void setTestOnBorrow(boolean testOnBorrow) {
        this.testOnBorrow = testOnBorrow;
    }

    public boolean isTestOnReturn() {
        return testOnReturn;
    }

    public void setTestOnReturn(boolean testOnReturn) {
        this.testOnReturn = testOnReturn;
    }

    @Bean
    public JedisPoolConfig jedisPoolConfig(){
        if (config == null) {
            config = new JedisPoolConfig();
//            config.setMaxTotal(maxTotal);
//            config.setMaxIdle(maxIdle);
//            config.setMinIdle(minIdle);
//            config.setMaxWaitMillis(maxWaitMillis);
//            config.setTestOnBorrow(testOnBorrow);
//            config.setTestOnReturn(testOnReturn);
        }
        return config;
    }


}

