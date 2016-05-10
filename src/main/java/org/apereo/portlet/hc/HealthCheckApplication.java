package org.apereo.portlet.hc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;

@SpringBootApplication
public class HealthCheckApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(HealthCheckApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(HealthCheckApplication.class);
    }

}
