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
<jsp:directive.include file="/WEB-INF/soffit/include.jsp"/>

<c:set var="n" value="${soffit.namespace}" />

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

<c:set var="req" value="${pageContext.request}" />
<c:set var="urlBase" value="${req.scheme}://${req.serverName}:${req.localPort}${req.contextPath}" />
<script src="${urlBase}/js/health-check.js" type="text/javascript"></script>

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
                    <a href="" class="alert-link hc-link"></a>
                </div>
                <div class="alert alert-danger hc-template-dead" role="alert" style="display: none;">
                    <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                    <a href="" class="alert-link hc-link"></a>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
up.jQuery(function() {
    var options = {
        serviceUrl: "${urlBase}/api/v1-0/health-check"
    };
    up.HealthCheck.Dashboard(up.jQuery, '#${n}', options);
});
</script>
