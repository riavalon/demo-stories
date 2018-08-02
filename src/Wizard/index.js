'use strict';


import './main.scss';

const Elm = require('./Main.elm');

console.log('DEMO SCRIPTS: Wizard Bootstrapping...');

const mount = document.createElement('div');
mount.setAttribute('id', 'dtb-wizard');
document.body.appendChild(mount);
const wizard = Elm.WizardMain.embed(mount);

console.log('%cWizard mounted successfully', 'background:#008aff;color:white');

chrome.runtime.onMessage.addListener((req, sender, sendRes) => {
  if (!sender.tab && req.message === 'start_demo') {
    wizard.ports.displayWizard.send(true);
  } else {
    console.log('%cERROR LOG: %o', 'background:red;color:white', sender.tab, req.message);
  }
});
