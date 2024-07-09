const base64Compile = str => WebAssembly.compile(typeof Buffer !== 'undefined' ? Buffer.from(str, 'base64') : Uint8Array.from(atob(str), b => b.charCodeAt(0)));

const instantiateCore = WebAssembly.instantiate;

function toUint32(val) {
  return val >>> 0;
}


let exports0;
let exports1;
let exports2;

function evalExpression(arg0, arg1, arg2) {
  var val0 = arg0;
  let enum0;
  switch (val0) {
    case 'add': {
      enum0 = 0;
      break;
    }
    case 'mul': {
      enum0 = 1;
      break;
    }
    default: {
      if ((arg0) instanceof Error) {
        console.error(arg0);
      }

      throw new TypeError(`"${val0}" is not one of the cases of op`);
    }
  }
  const ret = exports2['docs:calculator/calculate@0.1.0#eval-expression'](enum0, toUint32(arg1), toUint32(arg2));
  return ret >>> 0;
}

const $init = (async() => {
  const module0 = base64Compile('AGFzbQEAAAABBwFgAn9/AX8DAwIAAAc3Ahhkb2NzOmFkZGVyL2FkZEAwLjEuMCNhZGQAABhkb2NzOmFkZGVyL2FkZEAwLjEuMCNtdWwAAQoRAgcAIAAgAWoLBwAgACABbAsAGARuYW1lAhECAAIAAWEBAWIBAgABYQEBYgAvCXByb2R1Y2VycwEMcHJvY2Vzc2VkLWJ5AQ13aXQtY29tcG9uZW50BzAuMjA5LjE');
  const module1 = base64Compile('AGFzbQEAAAABDgJgAn9/AX9gA39/fwF/AjcCFGRvY3M6YWRkZXIvYWRkQDAuMS4wA2FkZAAAFGRvY3M6YWRkZXIvYWRkQDAuMS4wA211bAAAAwIBAQczAS9kb2NzOmNhbGN1bGF0b3IvY2FsY3VsYXRlQDAuMS4wI2V2YWwtZXhwcmVzc2lvbgACCiMBIQAgAEEARgRAIAEgAhAADwsgAEEBRgRAIAEgAhABDwsACwAhBG5hbWUBCwIAA2FkZAEDbXVsAg0BAgMAAm9wAQFhAgFiAC8JcHJvZHVjZXJzAQxwcm9jZXNzZWQtYnkBDXdpdC1jb21wb25lbnQHMC4yMDkuMQ');
  const module2 = base64Compile('AGFzbQEAAAABBwFgAn9/AX8CSwQFZmxhZ3MJaW5zdGFuY2UxA38BBWZsYWdzCWluc3RhbmNlMwN/AQZjYWxsZWUIYWRhcHRlcjAAAAZjYWxsZWUIYWRhcHRlcjEAAAMDAgAABxcCCGFkYXB0ZXIwAAIIYWRhcHRlcjEAAwqbAQJMAQF/IwFBAXFFBEAACyMAQQJxRQRAAAsjAEF9cSQAIwBBfnEkACAAIAEjAEEBciQAEAAhAiMBQX5xJAEgAiMBQQFyJAEjAEECciQAC0wBAX8jAUEBcUUEQAALIwBBAnFFBEAACyMAQX1xJAAjAEF+cSQAIAAgASMAQQFyJAAQASECIwFBfnEkASACIwFBAXIkASMAQQJyJAAL');
  const instanceFlags1 = new WebAssembly.Global({ value: "i32", mutable: true }, 3);
  const instanceFlags3 = new WebAssembly.Global({ value: "i32", mutable: true }, 3);
  ({ exports: exports0 } = await instantiateCore(await module0));
  ({ exports: exports1 } = await instantiateCore(await module2, {
    callee: {
      adapter0: exports0['docs:adder/add@0.1.0#add'],
      adapter1: exports0['docs:adder/add@0.1.0#mul'],
    },
    flags: {
      instance1: instanceFlags1,
      instance3: instanceFlags3,
    },
  }));
  ({ exports: exports2 } = await instantiateCore(await module1, {
    'docs:adder/add@0.1.0': {
      add: exports1.adapter0,
      mul: exports1.adapter1,
    },
  }));
})();

await $init;
const calculate010 = {
  evalExpression: evalExpression,

};

export { calculate010 as calculate, calculate010 as 'docs:calculator/calculate@0.1.0',  }
