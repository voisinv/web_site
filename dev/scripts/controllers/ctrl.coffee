
angular.module 'controllersModule'
  .controller 'hostCtrl', ($scope, icones) ->
    $scope.icones = icones
    undefined