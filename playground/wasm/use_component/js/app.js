import { calculate } from './calculator/calculator.js';
import { f } from './hello-world/hello-world.js';

console.log(calculate.evalExpression('add', 1, 2));
console.log(calculate.evalExpression('mul', 69, 42));

console.log(f());
