package fr.apiatlashub.server.application.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import fr.apiatlashub.server.domain.api.SimpleApi;
import fr.apiatlashub.server.domain.service.SimpleService;
import fr.apiatlashub.server.domain.spi.SimpleSpi;
import lombok.RequiredArgsConstructor;

@Configuration
@RequiredArgsConstructor
public class DomainConfiguration {

    private final SimpleSpi simpleSpi;

    @Bean
    public SimpleApi simpleApi() {
        return new SimpleService(simpleSpi);
    }
}
