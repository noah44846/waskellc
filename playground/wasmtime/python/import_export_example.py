from wasmtime import FuncType, Store, Module, Linker, ValType, WasiConfig, Engine

engine = Engine()
linker = Linker(engine)
linker.define_wasi()

store = Store(engine)
wasi = WasiConfig()
wasi.inherit_stdout()
wasi.inherit_stdin()
wasi.inherit_stderr()
wasi.inherit_env()
wasi.inherit_argv()
store.set_wasi(wasi)

def printInt(value):
    print(f'Printing from host: {value}')

linker.define_func("foreign", "printInt", FuncType([ValType.i32()], []), printInt)

module = Module.from_file(engine, '../../../waskellc/out.wasm')
instance = linker.instantiate(store, module)

main = instance.exports(store)["main"]
square = instance.exports(store)["square"]
sq_print = instance.exports(store)["sq_print"]

main(store)
print("square(5) =", square(store, 5))
sq_print(store, 2)
