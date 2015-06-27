angular.module 'directivesModule'
  .directive 'graph3Icones', (icones) ->
    restrict: 'A'
    link : (scope, elt, attrs) ->
      nodes = icones.icones.nodes
      links = icones.icones.links

      console.log(icones.icones.nodes, icones.icones.links)

      svg =
        d3.select '#graph3Icones'
            .append 'canvas'
            .attr 'width', 1280
            .attr 'height', 800

      force =
        d3.layout
        .force()
        .charge -120
        .linkDistance 300
        .size [1280, 800]
        .nodes nodes
        .links links
        #.start()

      link = svg
        .selectAll ".link"
        .data links
        .enter()
        .append "line"
        .attr "class", "link"
        .style "stroke-width", (d) -> Math.sqrt(d.value)

      node = svg
        .selectAll "circle"
        .data nodes
        .enter()
        .append "circle"
        .attr "r", (d) -> 85
        .call force.drag
        .style "fill", (d, i) -> '#3498db'
        .on 'mouseover', (d, i) ->
          d3.selectAll "circle"
            .attr 'opacity', 0.8
          d3.select @
            .attr 'opacity', 1

      svg.selectAll 'circle'
        .append 'image'

      #<image x="200" y="200" width="100px" height="100px"
      #xlink:href="myimage.png">
      force.on 'tick', ->
        console.log link
        console.log node
        link
          .attr "x1", (d) -> d.source.x
          .attr "y1", (d) -> d.source.y
          .attr "x2", (d) -> d.target.x
          .attr "y2", (d) -> d.target.y

        node
          .attr "cx", (d) -> d.x
          .attr "cy", (d) -> d.y
        true

      force.start()
      true


