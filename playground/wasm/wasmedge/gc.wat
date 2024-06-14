(module
    (type $tup (struct (field i64) (field i64) (field i32)))
    (type $vec3d (array (mut f64)))

    (func $f (export "f") (result i64)
      (local $t (ref $tup))
      (local.set $t
        (struct.new $tup (i64.const 1) (i64.const 2) (i32.const 1))
      )
      (struct.get $tup 1 (local.get $t))
    )

    (func $g (export "g")
      (local $v (ref $vec3d))
      (local.set $v
        (array.new $vec3d (f64.const 1) (i32.const 3))
      )
      (array.set $vec3d (local.get $v) (i32.const 2) (f64.const 5))
      (array.get $vec3d (local.get $v) (i32.const 1))
      (drop)
    )
)
