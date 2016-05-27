<%--

    Licensed to Apereo under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Apereo licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License.  You may obtain a
    copy of the License at the following location:

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet_2_0" %>

<c:set var="n"><portlet:namespace/></c:set>

<style>
#${n} .hc-spinner {
    padding: 16px;
    font-size: 400%;
    text-align: center;
}
#${n} .hc-items-container {
    font-size: 150%;
}
</style>

<script src="<c:url value="/js/health-check.js"/>" type="text/javascript"></script>

<div id="${n}">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Status of Systems on Campus</h3>
        </div>
        <div class="panel-body">
            <div class="hc-spinner">
                <i class="fa fa-spinner fa-spin" aria-hidden="true"></i>
            </div>
            <div class="hc-items-container" style="display: none;">
                <div class="alert alert-success hc-template-alive" role="alert" style="display: none;">
                    <i class="fa fa-check-square-o" aria-hidden="true"></i>
                    <a href="//www.yahoo.com" class="alert-link hc-link">Yahoo!</a>
                </div>
                <div class="alert alert-danger hc-template-dead" role="alert" style="display: none;">
                    <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                    <a href="//www.yahoo.com" class="alert-link hc-link">Yahoo!</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
up.jQuery(function() {
    var options = {
        serviceUrl: "${preferences['serviceUrl'][0]}"
    };
    up.HealthCheck.Dashboard(up.jQuery, '#${n}', options);
});
</script>
