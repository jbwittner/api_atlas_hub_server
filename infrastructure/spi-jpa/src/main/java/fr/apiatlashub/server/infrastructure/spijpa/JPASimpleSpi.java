package fr.apiatlashub.server.infrastructure.spijpa;

import java.util.List;

import org.springframework.stereotype.Component;

import fr.apiatlashub.server.domain.spi.SimpleSpi;
import fr.apiatlashub.server.infrastructure.spijpa.database.entity.SimpleEntity;
import fr.apiatlashub.server.infrastructure.spijpa.database.repository.SimpleEntityRepository;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class JPASimpleSpi implements SimpleSpi {

    private final SimpleEntityRepository simpleEntityRepository;

    @Override
    public List<String> getAll() {
        return simpleEntityRepository.findAll().stream()
                .map(SimpleEntity::getSimpleData)
                .toList();
    }
}
