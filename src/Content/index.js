'use strict';

require('./main.scss');

import Builder from './js/build-demo';

var Elm = require('./Main.elm');
var builder = new Builder();


console.log('DEMO SCRIPTS: content script injected into page!');

chrome.runtime.onMessage.addListener((req, sender, sendRes) => {
  if (!sender.tab && req.message === 'start_demo') {
    builder.init();
  } else {
    console.log('%cERROR LOG: %o', 'background:red;color:white', sender.tab, req.message);
  }
});
