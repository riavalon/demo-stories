'use strict';


require('./main.css');
require('./popup.html');


var Elm = require('./Main.elm');
var mount = document.getElementById('main');
var app = Elm.Main.embed(mount);