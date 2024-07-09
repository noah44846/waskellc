from hello_world import Root
from wasmtime import Store

store = Store()
out = Root(store)

print(out.f(store))
