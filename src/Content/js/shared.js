export class DemoListener {
  constructor(type, fn, cleanUp = () => {}) {
    this.type = type;
    this.fn = fn;
    this.cleanUp = cleanUp;
  }
}
