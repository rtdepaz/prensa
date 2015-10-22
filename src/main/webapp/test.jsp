<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<html ng-app="ui.bootstrap.demo">
  <head>
  
  <title>
	<tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute>
</title>
  
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<link href="css/theme.css" rel="stylesheet">
<link href="css/bootstrap-select.css" rel="stylesheet" type="text/css" >
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href="css/custom.css" rel="stylesheet">
<link rel='shortcut icon' href='favicon.ico'>
  	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular-animate.js"></script>
    <script src="//angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.14.1.js"></script>
    <script src="js/main.js"></script>
    <script src="js/angularctrls/test.js"></script>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
    
    <script type="text/javascript">
    	//var demoApp = angular.module('ui.bootstrap.demo', ['ngAnimate', 'ui.bootstrap']);
    </script>
  </head>
  <body>

<style>
  .typeahead-demo .custom-popup-wrapper {
    position: absolute;
    top: 100%;
    left: 0;
    z-index: 1000;
    display: none;
    background-color: #f9f9f9;
  }

  .typeahead-demo .custom-popup-wrapper > .message {
    padding: 10px 20px;
    border-bottom: 1px solid #ddd;
    color: #868686;
  }

  .typeahead-demo .custom-popup-wrapper > .dropdown-menu {
    position: static;
    float: none;
    display: block;
    min-width: 160px;
    background-color: transparent;
    border: none;
    border-radius: 0;
    box-shadow: none;
  }
</style>

<script type="text/ng-template" id="customTemplate.html">
  <a>
      <img ng-src="http://upload.wikimedia.org/wikipedia/commons/thumb/{{match.model.flag}}" width="16">
      <span ng-bind-html="match.label | uibTypeaheadHighlight:query"></span>
  </a>
</script>

<script type="text/ng-template" id="customPopupTemplate.html">
  <div class="custom-popup-wrapper"
     ng-style="{top: position().top+'px', left: position().left+'px'}"
     style="display: block;"
     ng-show="isOpen() && !moveInProgress"
     aria-hidden="{{!isOpen()}}">
    <p class="message">select location from drop down.</p>

    <ul class="dropdown-menu" role="listbox">
        <li ng-repeat="match in matches track by $index" ng-class="{active: isActive($index) }"
            ng-mouseenter="selectActive($index)" ng-click="selectMatch($index)" role="option" id="{{::match.id}}">
            <div uib-typeahead-match index="$index" match="match" query="query" template-url="templateUrl"></div>
        </li>
    </ul>
  </div>
</script>

<div class='container-fluid typeahead-demo' ng-controller="TypeaheadCtrl">

    <h4>Static arrays</h4>
    <pre>Model: {{selected | json}}</pre>
    <input type="text" ng-model="selected" uib-typeahead="state for state in states | filter:$viewValue | limitTo:8" class="form-control">

    <!-- <h4>Asynchronous results</h4>
    <pre>Model: {{asyncSelected | json}}</pre>
    <input type="text" ng-model="asyncSelected" placeholder="Locations loaded via $http" uib-typeahead="address for address in getLocation($viewValue)" typeahead-loading="loadingLocations" typeahead-no-results="noResults" class="form-control">
    <i ng-show="loadingLocations" class="glyphicon glyphicon-refresh"></i>
    <div ng-show="noResults">
      <i class="glyphicon glyphicon-remove"></i> No Results Found
    </div>

    <h4>Custom templates for results</h4>
    <pre>Model: {{customSelected | json}}</pre>
    <input type="text" ng-model="customSelected" placeholder="Custom template" uib-typeahead="state as state.name for state in statesWithFlags | filter:{name:$viewValue}" typeahead-template-url="customTemplate.html" class="form-control">

    <h4>Custom popup templates for typeahead's dropdown</h4>
    <pre>Model: {{customPopupSelected | json}}</pre>
    <input type="text" ng-model="customPopupSelected" placeholder="Custom popup template" uib-typeahead="state as state.name for state in statesWithFlags | filter:{name:$viewValue}" typeahead-popup-template-url="customPopupTemplate.html" class="form-control">
 --></div>
  </body>
</html>
