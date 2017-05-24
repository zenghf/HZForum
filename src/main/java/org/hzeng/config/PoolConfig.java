package org.hzeng.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * Created by hzeng on 4/18/17.
 */
// TODO: rewrite pool config
@Configuration
@ConfigurationProperties("spring.redis.pool")
// @EnableConfigurationProperties(JedisConfig.class)
@Import(JedisConfig.class)
public class PoolConfig {

    @Autowired
    JedisPoolConfig jedisPoolConfig;

    String host;
    int port;
    int timeout;
    String password;

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }

    public int getTimeout() {
        return timeout;
    }

    public void setTimeout(int timeout) {
        this.timeout = timeout;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Bean
    public JedisPool jedisPool(){
        return new JedisPool(jedisPoolConfig, host, port, timeout, password);
    }
}
