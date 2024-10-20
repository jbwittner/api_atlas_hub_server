package fr.apiatlashub.server.application.configuration;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@Configuration
@ComponentScans({
    @ComponentScan(basePackages = "fr.apiatlashub.server.infrastructure.apirest"),
    @ComponentScan(basePackages = "fr.apiatlashub.server.infrastructure.spijpa")
})
@EntityScan("fr.apiatlashub.server.infrastructure.spijpa.database.entity")
@EnableJpaRepositories("fr.apiatlashub.server.infrastructure.spijpa.database.repository")
public class AggregationConfiguration {}
