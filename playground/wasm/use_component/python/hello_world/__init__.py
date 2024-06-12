from .intrinsics import _decode_utf8, _load
import ctypes
import importlib_resources
import pathlib
import wasmtime

class Root:

    def __init__(self, store: wasmtime.Store) -> None:
        file = importlib_resources.files() / ('root.core0.wasm')
        if isinstance(file, pathlib.Path):
            module = wasmtime.Module.from_file(store.engine, file)
        else:
            module = wasmtime.Module(store.engine, file.read_bytes())
        instance0 = wasmtime.Instance(store, module, []).exports(store)
        core_memory0 = instance0["memory"]
        assert(isinstance(core_memory0, wasmtime.Memory))
        self._core_memory0 = core_memory0
        lift_callee0 = instance0["f"]
        assert(isinstance(lift_callee0, wasmtime.Func))
        self.lift_callee0 = lift_callee0
    def f(self, caller: wasmtime.Store) -> str:
        ret = self.lift_callee0(caller)
        assert(isinstance(ret, int))
        load = _load(ctypes.c_int32, self._core_memory0, caller, ret, 0)
        load0 = _load(ctypes.c_int32, self._core_memory0, caller, ret, 4)
        ptr = load
        len1 = load0
        list = _decode_utf8(self._core_memory0, caller, ptr, len1)
        return list
