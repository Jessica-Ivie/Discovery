<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="entheos-discovery-icon" href="${resource(dir: 'images', file: 'entheos_discovery_icon')}">
		<link rel="entheos-discovery-icon" sizes="114x114" href="${resource(dir: 'images', file: 'entheos_discovery_icon.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<div id="telescopeLogo" role="banner"><img src="${resource(dir: 'images', file: 'entheos_discovery.png')}" alt="Discover Logo"/></div>

    <ul id="globalnav">
        <g:tabItem controller="home" label="Home" />
        <g:tabItem controller="signUp" label="Sign Up" />
        %{--<ul>--}%
          %{--<li><a href="#">Information</a></li>--}%
          %{--<li><a href="#">Team</a></li>--}%
          %{--<li><a href="#">Culture</a></li>--}%
          %{--<li><a href="#">Careers</a></li>--}%
          %{--<li><a href="#" class="here">History</a></li>--}%
          %{--<li><a href="#">Sponsorship</a></li>--}%
        %{--</ul>--}%
      </li>
        <g:tabItem controller="information" label="Information" />
        <g:tabItem controller="volunteers" label="Volunteers" />
        <g:tabItem controller="parents" label="Parents" />
        <g:tabItem controller="admin" label="Admin" />
    </ul>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
