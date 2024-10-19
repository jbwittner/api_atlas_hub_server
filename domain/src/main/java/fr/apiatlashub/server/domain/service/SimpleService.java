package fr.apiatlashub.server.domain.service;

import fr.apiatlashub.server.domain.api.SimpleApi;

public class SimpleService implements SimpleApi {

    @Override
    public String sayHello() {
        return "Hello World!";
    }
}
