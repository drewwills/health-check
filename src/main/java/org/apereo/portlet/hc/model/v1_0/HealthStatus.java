package org.apereo.portlet.hc.model.v1_0;

public class HealthStatus {

    private final String url;
    private final String title;
    private final boolean alive;

    public HealthStatus(String url, String title, boolean alive) {
        this.url = url;
        this.title = title;
        this.alive = alive;
    }

    public String getUrl() {
        return url;
    }

    public String getTitle() {
        return title;
    }

    public boolean isAlive() {
        return alive;
    }

}
