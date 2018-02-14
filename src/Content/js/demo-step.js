import { DemoListener } from './shared';


export class DemoStep {
  constructor(stepIndex) {
    this.index = stepIndex;
    this.actionNumber = 0;
    this.listeners = [];
  }

  addAction(actionName) {
    switch (actionName, values) {
    case 'text_popup':
      this.addTextPopup(values);
      break;
    case 'snippet':
      this.addSnippet(values);
      break;
    case 'highlight':
      this.addHighlight(values);
      break;
    default:
      this.addHighlight(values);
    }
  }

  addTextPopup({text, inc}) {
  }

  addSnippet({snippet, inc}) {
  }

  addHighlight({element, inc}) {
    const hoverOn = new DemoListener(
      'mouseon',
      event => {
        event.target.classList.add('DTE-highlight');
      },
      () => {
        element.classList.remove('DTE-highlight');
      },
    );

    const hoverOff = new DemoListener(
      'mouseoff',
      event => {
        event.target.classList.remove('DTE-highlight');
      },
      () => {
        element.classList.remove('DTE-highlight');
      },
    );

    this.listeners.push(hoverOn);
    this.listeners.push(hoverOff);

    element.addEventListener(hoverOn.type, hoverOn.fn);
    element.addEventListener(hoverOff.type, hoverOff.fn);
  }

  getRepresentation() {
    return {
      actions: this.actions,
      stepIndex: this.index,
    };
  }

  teardown() {
    return new Promise((resolve, _) => {
      this.listeners.forEach(listener => {
        listener.cleanUp();
        document.removeEventListener(listener.type, listener.fn);
      });

      resolve();
    });
  }

  setup() {
  }

  _incrementActionNumber(inc) {
    if (inc) {
      this.actionNumber++;
    }
  }
}
