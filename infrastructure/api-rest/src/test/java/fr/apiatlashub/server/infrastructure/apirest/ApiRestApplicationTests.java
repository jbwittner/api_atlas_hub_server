package fr.apiatlashub.server.infrastructure.apirest;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;

import fr.apiatlashub.server.domain.api.SimpleApi;

@SpringBootTest
class ApiRestApplicationTests {

    @MockBean
    private SimpleApi simpleApi;

    @Test
    void contextLoads() {}
}
