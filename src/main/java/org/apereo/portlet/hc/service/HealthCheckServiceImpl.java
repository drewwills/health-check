package org.apereo.portlet.hc.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.apereo.portlet.hc.HealthCheckService;
import org.apereo.portlet.hc.model.v1_0.HealthStatus;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class HealthCheckServiceImpl implements HealthCheckService {

    private static final String SERVICES_JSON_LOCATION = "classpath:/services.json";
    private static final String FIELD_NAME_STRATEGY = "strategy";

    private JsonNode servicesJson;

    @Value(SERVICES_JSON_LOCATION)
    private Resource servicesJsonResource;

    @PostConstruct
    public void init() {
        final ObjectMapper mapper = new ObjectMapper();
        try {
            servicesJson = mapper.readTree(servicesJsonResource.getInputStream());
            if (!servicesJson.isArray()) {
                throw new RuntimeException("services.json does not contain a JsonArray");
            }
        } catch (IOException e) {
            throw new RuntimeException("Failed to parse services.json into JsonNode;  servicesJsonResource=" + servicesJsonResource, e);
        }
    }

    @Cacheable("healthCheckCache")
    @Override
    public List<HealthStatus> checkHealth() {
        final List<HealthStatus> rslt = new ArrayList<>();
        for (JsonNode node : servicesJson) {
            final String strategyName = node.get(FIELD_NAME_STRATEGY).asText();
            final HealthCheckStrategy strategy = HealthCheckStrategy.valueOf(strategyName);
            final HealthStatus status = strategy.checkHealth(node);
            if (status != null) {
                rslt.add(status);
            }
        }
        return rslt;
    }

}
