package org.apereo.portlet.hc.rest;

import java.util.List;

import org.apereo.portlet.hc.HealthCheckService;
import org.apereo.portlet.hc.model.v1_0.HealthStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.AbstractJsonpResponseBodyAdvice;

@Controller
@RequestMapping("/api")
public class HealthCheckRestController {

    @Autowired
    private HealthCheckService healthCheckService;

    @RequestMapping(method=RequestMethod.GET, value="/v1-0/health-check")
    public @ResponseBody List<HealthStatus> getHealthStatus() {
        return healthCheckService.checkHealth();
    }

    @ControllerAdvice
    static class JsonpAdvice extends AbstractJsonpResponseBodyAdvice {
        public JsonpAdvice() {
            super("callback");
        }
    }

}
