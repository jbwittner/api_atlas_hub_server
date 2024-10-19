package fr.apiatlashub.server.infrastructure.apirest;

import fr.apiatlashub.server.domain.api.SimpleApi;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;

@SpringBootTest
class ApiRestApplicationTests {

    @MockBean
    private SimpleApi simpleApi;

    @Test
    void contextLoads() {}
}
