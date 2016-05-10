<jsp:directive.include file="/WEB-INF/soffit/include.jsp"/>

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
