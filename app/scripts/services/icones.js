(function() {
  angular.module('servicesModule').factory('icones', function() {
    return {
      icones: {
        nodes: [
          {
            name: 'vv',
            id: 0,
            radius: 250,
            group: 0
          }, {
            name: 'github',
            id: 1,
            radius: 50,
            group: 1
          }, {
            name: 'twitter',
            id: 2,
            radius: 50,
            group: 2
          }
        ],
        links: [
          {
            source: 0,
            target: 1,
            value: 10
          }, {
            source: 1,
            target: 2,
            value: 10
          }, {
            source: 0,
            target: 2,
            value: 10
          }
        ]
      }
    };
  });

}).call(this);
