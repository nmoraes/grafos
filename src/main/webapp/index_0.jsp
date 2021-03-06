<!-- START SIGMA IMPORTS -->
<script src="sigma.js/src/sigma.core.js"></script>
<script src="sigma.js/src/conrad.js"></script>
<script src="sigma.js/src/utils/sigma.utils.js"></script>
<script src="sigma.js/src/utils/sigma.polyfills.js"></script>
<script src="sigma.js/src/sigma.settings.js"></script>
<script src="sigma.js/src/classes/sigma.classes.dispatcher.js"></script>
<script src="sigma.js/src/classes/sigma.classes.configurable.js"></script>
<script src="sigma.js/src/classes/sigma.classes.graph.js"></script>
<script src="sigma.js/src/classes/sigma.classes.camera.js"></script>
<script src="sigma.js/src/classes/sigma.classes.quad.js"></script>
<script src="sigma.js/src/classes/sigma.classes.edgequad.js"></script>
<script src="sigma.js/src/captors/sigma.captors.mouse.js"></script>
<script src="sigma.js/src/captors/sigma.captors.touch.js"></script>
<script src="sigma.js/src/renderers/sigma.renderers.canvas.js"></script>
<script src="sigma.js/src/renderers/sigma.renderers.webgl.js"></script>
<script src="sigma.js/src/renderers/sigma.renderers.svg.js"></script>
<script src="sigma.js/src/renderers/sigma.renderers.def.js"></script>
<script src="sigma.js/src/renderers/webgl/sigma.webgl.nodes.def.js"></script>
<script src="sigma.js/src/renderers/webgl/sigma.webgl.nodes.fast.js"></script>
<script src="sigma.js/src/renderers/webgl/sigma.webgl.edges.def.js"></script>
<script src="sigma.js/src/renderers/webgl/sigma.webgl.edges.fast.js"></script>
<script src="sigma.js/src/renderers/webgl/sigma.webgl.edges.arrow.js"></script>
<script src="sigma.js/src/renderers/canvas/sigma.canvas.labels.def.js"></script>
<script src="sigma.js/src/renderers/canvas/sigma.canvas.hovers.def.js"></script>
<script src="sigma.js/src/renderers/canvas/sigma.canvas.nodes.def.js"></script>
<script src="sigma.js/src/renderers/canvas/sigma.canvas.edges.def.js"></script>
<script src="sigma.js/src/renderers/canvas/sigma.canvas.edges.curve.js"></script>
<script src="sigma.js/src/renderers/canvas/sigma.canvas.edges.arrow.js"></script>
<script src="sigma.js/src/renderers/canvas/sigma.canvas.edges.curvedArrow.js"></script>
<script src="sigma.js/src/renderers/canvas/sigma.canvas.edgehovers.def.js"></script>
<script src="sigma.js/src/renderers/canvas/sigma.canvas.edgehovers.curve.js"></script>
<script src="sigma.js/src/renderers/canvas/sigma.canvas.edgehovers.arrow.js"></script>
<script src="sigma.js/src/renderers/canvas/sigma.canvas.edgehovers.curvedArrow.js"></script>
<script src="sigma.js/src/renderers/canvas/sigma.canvas.extremities.def.js"></script>
<script src="sigma.js/src/renderers/svg/sigma.svg.utils.js"></script>
<script src="sigma.js/src/renderers/svg/sigma.svg.nodes.def.js"></script>
<script src="sigma.js/src/renderers/svg/sigma.svg.edges.def.js"></script>
<script src="sigma.js/src/renderers/svg/sigma.svg.edges.curve.js"></script>
<script src="sigma.js/src/renderers/svg/sigma.svg.labels.def.js"></script>
<script src="sigma.js/src/renderers/svg/sigma.svg.hovers.def.js"></script>
<script src="sigma.js/src/middlewares/sigma.middlewares.rescale.js"></script>
<script src="sigma.js/src/middlewares/sigma.middlewares.copy.js"></script>
<script src="sigma.js/src/misc/sigma.misc.animation.js"></script>
<script src="sigma.js/src/misc/sigma.misc.bindEvents.js"></script>
<script src="sigma.js/src/misc/sigma.misc.bindDOMEvents.js"></script>
<script src="sigma.js/src/misc/sigma.misc.drawHovers.js"></script>
<!-- END SIGMA IMPORTS -->
<script src="sigma.js/plugins/sigma.renderers.customShapes/shape-library.js"></script>
<script src="sigma.js/plugins/sigma.renderers.customShapes/sigma.renderers.customShapes.js"></script>
<script src="sigma.js/plugins/sigma.plugins.dragNodes/sigma.plugins.dragNodes.js"></script>

<div id="container">
  <style>
    #graph-container {
      top: 0;
      bottom: 0;
      left: 0;
      right: 0;
      position: absolute;
    }
  </style>
  <div id="graph-container"></div>
</div>
<script>
/**
 * IMPORTANT: This only works with the canvas renderer. TBD in the future
 * will also support the WebGL renderer.
 */
sigma.utils.pkg('sigma.canvas.nodes');

// generate a random graph
var i,
    s,
    img,
    N = 100,
    E = 500,
    g = {
      nodes: [],
      edges: []
    },
    urls = [
      'sigma.js/src/img/forlan.png',
      'sigma.js/src/img/doc.png',
      'sigma.js/src/img/josema.png', 
      'sigma.js/src/img/luis.png',
      'sigma.js/src/img/lugano.png', 'sigma.js/src/img/noimage.png'
    ],
  
    colors = [
      '#617db4',
      '#668f3c',
      '#c6583e',
      '#b956af'
    ];

// Generate a random graph, going through the different shapes
for (i = 0; i < N; i++) {
  var node = {
    id: 'n' + i,
    label: 'DR Who #' + i,

    // note the ShapeLibrary.enumerate() returns the names of all
    // supported renderers
   // type: ShapeLibrary.enumerate().map(function(s){return s.name;})[Math.round(Math.random()*5)],
   type:'circle',
   x: Math.random(),
    y: Math.random(),
    size: Math.random(),
    color: colors[Math.floor(Math.random() * colors.length)],
    borderColor: colors[Math.floor(Math.random()* colors.length)]
  };

  //if(Math.random()>0.75 && node.type!='pacman') { // ~0.75 of the (non-pacman)shapes will have an image
    node.image = {
      url: urls[Math.floor(Math.random() * urls.length)],
      // scale/clip are ratio values applied on top of 'size'
      scale: 1.3,
      clip: 0.85
    }
 // }
// TIPO DE FORMA DE NODO
//  switch(node.type) {
 //   case "equilateral":
//      node.equilateral = {
//        rotate: Math.random()*45, // random rotate up to 45 deg
//        numPoints: Math.round(5 + Math.random()*3)
//      }
 //     break;
 //   case "star":
 //     node.star = {
 //       innerRatio: 0.4 + Math.random()*0.2,
 //       numPoints: Math.round(4 + Math.random()*3)
 //     }
 //     if(node.image) {
        // note clip/scale are ratio values. So we fit them to the inner ratio of the star shape
 //       node.image.clip = node.star.innerRatio *0.95;
 //       node.image.scale = node.star.innerRatio *1.2;
  //    }
   //   break;
  //  case "square":
 //   case "diamond":
  //    if(node.image) {
        // note clip/scale are ratio values. So we fit them to the borders of the square shape
  //      node.image.clip = 0.7;
   //   }
   //   break;
  //  case "circle":
  //    break;
  //  case "cross":
   //   node.cross = {
    //    lineWeight: Math.round(Math.random() * 5)
   //   }
   //   break;
 // }
  g.nodes.push(node);
}


for (i = 0; i < E; i++)
  g.edges.push({
    id: 'e' + i,
    source: 'n' + (Math.random() * N | 0),
    target: 'n' + (Math.random() * N | 0),
    size: Math.random(),
    
    color: '#ccc',
    hover_color: '#000'
    
  });

s = new sigma({
  graph: g,
  renderer: {
    // IMPORTANT:
    // This works only with the canvas renderer, so the
    // renderer type set as "canvas" is necessary here.
    container: document.getElementById('graph-container'),
    type: 'canvas'
  },
  settings: {
    minNodeSize: 8,
    maxNodeSize: 16,
    
    doubleClickEnabled: true,
    minEdgeSize: 0.5,
    maxEdgeSize: 4,
    enableEdgeHovering: true,
    edgeHoverColor: 'edge',
    defaultEdgeHoverColor: '#000',
    edgeHoverSizeRatio: 1,
    edgeHoverExtremities: true,
    
    drawLabels: false
    
  }
});
CustomShapes.init(s);
s.refresh();

//Initialize the dragNodes plugin:
var dragListener = sigma.plugins.dragNodes(s, s.renderers[0]);

dragListener.bind('startdrag', function(event) {
  console.log(event);
});
dragListener.bind('drag', function(event) {
  console.log(event);
});
dragListener.bind('drop', function(event) {
  console.log(event);
});
dragListener.bind('dragend', function(event) {
  console.log(event);
});



</script>
