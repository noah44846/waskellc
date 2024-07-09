import inspect

import wasmtime.loader
import tree

def bytes_to_int32(memory, store, ptr):
    return memory.data_ptr(store)[ptr + 3] * 2**24 + memory.data_ptr(store)[ptr + 2] * 2**16 + memory.data_ptr(store)[ptr + 1] * 2**8 + memory.data_ptr(store)[ptr]

def write_int32(memory, store, ptr, value):
    memory.data_ptr(store)[ptr] = value & 0xFF
    memory.data_ptr(store)[ptr + 1] = (value >> 8) & 0xFF
    memory.data_ptr(store)[ptr + 2] = (value >> 16) & 0xFF
    memory.data_ptr(store)[ptr + 3] = (value >> 24) & 0xFF

def parse_waskell_list(memory, store, list_ptr):
    result = []
    while True:
        data_constr = bytes_to_int32(memory, store, list_ptr + 4)
        if data_constr == 0:
            break

        data = bytes_to_int32(memory, store, list_ptr + 8)
        result.append(data)
        list_ptr = bytes_to_int32(memory, store, list_ptr + 12)
    return result

def create_waskell_tree(memory, store, empty_fn, node_fn, make_val_fn, data):
    def recurse(data):
        if data is None:
            return empty_fn()

        l_ptr = recurse(data.get("l"))
        r_ptr = recurse(data.get("r"))
        val_ptr = make_val_fn(0, data.get("e"))
        return node_fn(l_ptr, val_ptr, r_ptr)

    res = recurse(data)
    res = bytes_to_int32(memory, store, res + 1)
    return res

flattenDfs = tree.flattenDfs
exampleTreeFlattened = tree.exampleTreeFlattened
empty = tree.empty
node = tree.node
make_val = list(filter(lambda x: x[0] == ":make_val", inspect.getmembers(tree)))[0][1]
memory = tree.memory
store = wasmtime.loader.store

list_ptr = exampleTreeFlattened()
print(parse_waskell_list(memory, store, list_ptr))

example_tree = {
    "e": 2,
    "l": {
        "e": 1,
        "l": None,
        "r": None,
    },
    "r": {
        "e": 3,
        "l": None,
        "r": None,
    },
}

tree_ptr = create_waskell_tree(memory, wasmtime.loader.store, empty, node, make_val, example_tree)
flattened_ptr = flattenDfs(tree_ptr)
print(parse_waskell_list(memory, store, flattened_ptr))
