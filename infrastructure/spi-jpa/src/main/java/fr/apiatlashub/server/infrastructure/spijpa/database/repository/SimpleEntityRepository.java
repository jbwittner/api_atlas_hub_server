package fr.apiatlashub.server.infrastructure.spijpa.database.repository;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import fr.apiatlashub.server.infrastructure.spijpa.database.entity.SimpleEntity;

public interface SimpleEntityRepository extends JpaRepository<SimpleEntity, UUID> {}
