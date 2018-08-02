'use strict';

import { DemoStep } from './demo-step';
import { DemoListener } from './shared';


export default class DemoBuilder {
  constructor() {
    this.subscriptions = [];
  }

  init() {
    console.log('%cStarting demo creation workflow...', 'background:#008aff;color:white');
    this._showControls();
    this.recordNextStep();
  }

  selectElement() {
  }

  showPopupMenu() {
  }

  saveInfo() {
  }

  recordPreviousStep() {
  }

  recordNextStep() {
  }

  next(prevStep, nextStep) {
    prevStep.tearDown().then(() => {
      nextStep.setup();
    });
  }


  _saveStep() {
  }

  _loadStep() {
  }

  _cleanUp() {
    this.subscriptions.forEach(sub => {
      sub.cleanUp();
    });
  }

  _showControls() {
    const nextStep = document.createElement('button');
    nextStep.setAttribute('id', 'dtb-next-step-button');
    const finishBuilding = document.createElement('button');
    finishBuilding.setAttribute('id', 'dtb-finish-demo-button');
    const controlsContainer = document.createElement('div');
    controlsContainer.setAttribute('id', 'dtb-controls-container');

    const finishBuildingEvent = new DemoListener(
      'click',
      e => this._cleanUp(),
      () => document.removeChild(finishBuilding)
    );
    finishBuilding.addEventListner(
      finishBuildingEvent.type,
      finishBuildingEvent.fn
    );

    const nextStepEvent = new DemoListner(
      'click',
      e => this.recordNextStep(),
      () => document.removeChild(nextStep)
    );
    nextStep.addEventListener(
      nextStepEvent.type,
      nextStepEvent.fn
    );

    this.subscriptions.push(nextStepEvent);
    this.subscriptions.push(finishBuildingEvent);

    controlsContainer.appendChild(nextStep);
    controlsContainer.appendChild(finishBuilding);
  }
}
