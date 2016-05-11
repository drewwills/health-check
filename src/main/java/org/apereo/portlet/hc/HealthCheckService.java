package org.apereo.portlet.hc;

import java.util.List;

import org.apereo.portlet.hc.model.v1_0.HealthStatus;

public interface HealthCheckService {

    List<HealthStatus> checkHealth();

}
