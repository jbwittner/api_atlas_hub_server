package fr.apiatlashub.server.application.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import fr.apiatlashub.server.domain.api.SimpleApi;
import fr.apiatlashub.server.domain.service.SimpleService;

@Configuration
public class DomainConfiguration {

    @Bean
    public SimpleApi simpleApi() {
        return new SimpleService();
    }
}
