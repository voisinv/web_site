(function() {
  angular.module('directivesModule').directive('graph3Icones', function(icones) {
    return {
      restrict: 'A',
      link: function(scope, elt, attrs) {
        var force, link, links, node, nodes, svg;
        nodes = icones.icones.nodes;
        links = icones.icones.links;
        console.log(icones.icones.nodes, icones.icones.links);
        svg = d3.select('#graph3Icones').append('canvas').attr('width', 1280).attr('height', 800);
        force = d3.layout.force().charge(-120).linkDistance(300).size([1280, 800]).nodes(nodes).links(links);
        link = svg.selectAll(".link").data(links).enter().append("line").attr("class", "link").style("stroke-width", function(d) {
          return Math.sqrt(d.value);
        });
        node = svg.selectAll("circle").data(nodes).enter().append("circle").attr("r", function(d) {
          return 85;
        }).call(force.drag).style("fill", function(d, i) {
          return '#3498db';
        }).on('mouseover', function(d, i) {
          d3.selectAll("circle").attr('opacity', 0.8);
          return d3.select(this).attr('opacity', 1);
        });
        svg.selectAll('circle').append('image');
        force.on('tick', function() {
          console.log(link);
          console.log(node);
          link.attr("x1", function(d) {
            return d.source.x;
          }).attr("y1", function(d) {
            return d.source.y;
          }).attr("x2", function(d) {
            return d.target.x;
          }).attr("y2", function(d) {
            return d.target.y;
          });
          node.attr("cx", function(d) {
            return d.x;
          }).attr("cy", function(d) {
            return d.y;
          });
          return true;
        });
        force.start();
        return true;
      }
    };
  });

}).call(this);
