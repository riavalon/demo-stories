'use strict';


import './popup.html';
import './main.scss';
import '../../assets/demo_tickets_icon_16.png';
import '../../assets/demo_tickets_icon_48.png';
import '../../assets/demo_tickets_icon_128.png';
import '../../manifest.json';


const Elm = require('./Main.elm');

document.addEventListener('DOMContentLoaded', function() {
  let mount, app;
  setTimeout(() => {
    mount = document.getElementById('main');
    app = Elm.Main.embed(mount);

    chrome.storage.local.get('sprint_demos', data => {
      if (chrome.runtime.lastError) {
        console.error('runtime had an error');
        return;
      }

      app.ports.load.send(data.sprint_demos);
    });

    app.ports.save.subscribe(demos => {
      console.log('received demo: ', demos);
      chrome.storage.local.set({sprint_demos: demos}, () => {
        console.log('Saved data successfully');
      });
    });

    app.ports.removeDemo.subscribe(editObject => {
      var newDemos = editObject.demos.filter(
        demo => editObject.demos.indexOf(demo) !== editObject.index);

      chrome.storage.local.set({sprint_demos: newDemos}, () => {
        app.ports.load.send(newDemos);
      });
    });

    app.ports.startDemoBuilder.subscribe(testString => {
      console.log('Got testString', testString);

      chrome.tabs.query({active: true, currentWindow: true}, tabs => {
        chrome.tabs.sendMessage(tabs[0].id, {message: testString}, response => {
          console.log('response received', JSON.stringify(response, null, 2));
        });
      });
    });
  }, 0);
});
