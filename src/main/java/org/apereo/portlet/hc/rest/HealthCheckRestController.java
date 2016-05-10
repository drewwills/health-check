package org.apereo.portlet.hc.rest;

import java.util.ArrayList;
import java.util.List;

import org.apereo.portlet.hc.model.v1_0.HealthStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/api")
public class HealthCheckRestController {

    @RequestMapping(method=RequestMethod.GET, value="/v1-0/health-check")
    public @ResponseBody List<HealthStatus> getHealthStatus() {
        final List<HealthStatus> rslt = new ArrayList<>();
        rslt.add(new HealthStatus("https://www.facebook.com/", "Facebook", true));
        rslt.add(new HealthStatus("https://www.yahoo.com/", "Yahoo!", true));
        rslt.add(new HealthStatus("http://www.blackboard.com/", "Blackboard", false));
        return rslt;
    }

}
