modulesToInject = [
  'ngRoute'
  'controllersModule'
  'servicesModule'
  'directivesModule'
]
angular.module 'myApp', modulesToInject
  .config(['$routeProvider', ($routeProvider) ->

    $routeProvider
    .when '/main', {
      controller : 'hostCtrl'
      templateUrl : 'partials/main.html'
    }
    .otherwise {
      redirectTo: '/main'
    }
  ])


angular.module 'controllersModule', []
angular.module 'servicesModule', []
angular.module 'directivesModule', []

