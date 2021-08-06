function sumThree(num1, num2, num3) {
    return num1 + num2 + num3;
}

sumThree(4, 20, 6); // == 30

// you'll write `Function#curry`!
// Function.prototype.curry = function(num) {
//     return function(num1) {
//         return function(num2) {
//             return function(num3) {
//                 return sumThree(num1, num2, num3);
//             }
//         }
//     }
// }

// let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30

// or more briefly:
// console.log(sumThree.curry(3)(4)(20)(6)); // == 30




function curriedSum(numArgs) {
    const numbers = [];

    return function _curriedSum(num) {
        numbers.push(num);
        if(numbers.length === numArgs) {
            return numbers.reduce((acc, el) => acc + el);
        }
        else {
            return _curriedSum;
        }
    }
}

const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1)); // => 56

Function.prototype.curry = function(numArgs) {
    const thisFunction = this;
    const currentArgs = [];

    return function _thisFunction(num) {
        if (numArgs === currentArgs.length) {
            console.log(currentArgs);
            return thisFunction(...currentArgs);
        } 
        else {
            
            currentArgs.push(num);
            return _thisFunction;
        }
    }
}

function multiplyNums(...nums) {
    let product = 1; 
    nums.forEach(num => {product *= num});
    console.log(product);
}

// multiplyNums(2,2,4,2); // => 32

const curriedFunc = multiplyNums.curry(4);
curriedFunc(2)(2)(4)(2);