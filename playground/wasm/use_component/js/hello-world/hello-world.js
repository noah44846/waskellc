const base64Compile = str => WebAssembly.compile(typeof Buffer !== 'undefined' ? Buffer.from(str, 'base64') : Uint8Array.from(atob(str), b => b.charCodeAt(0)));

let dv = new DataView(new ArrayBuffer());
const dataView = mem => dv.buffer === mem.buffer ? dv : dv = new DataView(mem.buffer);

const instantiateCore = WebAssembly.instantiate;

const utf8Decoder = new TextDecoder();


let exports0;
let memory0;

function f() {
  const ret = exports0.f();
  var ptr0 = dataView(memory0).getInt32(ret + 0, true);
  var len0 = dataView(memory0).getInt32(ret + 4, true);
  var result0 = utf8Decoder.decode(new Uint8Array(memory0.buffer, ptr0, len0));
  return result0;
}

const $init = (async() => {
  const module0 = base64Compile('AGFzbQEAAAABBQFgAAF/AwIBAAUDAQABBw4CBm1lbW9yeQIAAWYAAAoUARIAQQBBCDYCAEEEQQ02AgBBAAsLEwEAQQgLDUhlbGxvLCBXb3JsZCEALwlwcm9kdWNlcnMBDHByb2Nlc3NlZC1ieQENd2l0LWNvbXBvbmVudAcwLjIwOS4x');
  ({ exports: exports0 } = await instantiateCore(await module0));
  memory0 = exports0.memory;
})();

await $init;

export { f,  }
