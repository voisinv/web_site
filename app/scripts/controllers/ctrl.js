(function() {
  angular.module('controllersModule').controller('hostCtrl', function($scope, icones) {
    $scope.icones = icones;
    return void 0;
  });

}).call(this);
