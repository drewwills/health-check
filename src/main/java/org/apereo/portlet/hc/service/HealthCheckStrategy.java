package org.apereo.portlet.hc.service;

import org.apereo.portlet.hc.model.v1_0.HealthStatus;

import com.fasterxml.jackson.databind.JsonNode;

public enum HealthCheckStrategy {

    HTTP_HEAD {
        @Override
        public HealthStatus checkHealth(JsonNode json) {
            return new HealthStatus(
                json.get(FIELD_NAME_URL).asText(),
                json.get(FIELD_NAME_TITLE).asText(),
                true
            );
        }
    };

    private static final String FIELD_NAME_URL = "url";
    private static final String FIELD_NAME_TITLE = "title";

    public abstract HealthStatus checkHealth(JsonNode json);

}
