
Array.prototype.range = function (start,end) {
    if (this.length === 1) {
        return this;
    }
    else {
        return [this[start]].concat(this.slice(start+1, end+1).range(0, this.slice(start+1, end+1).length));
    }
}

// const array1 = [1, 2, 3, 4, 5, 6];
// console.log(array1.range(1, 3));


function recSum(arr) {
    if (arr.length === 1) {
        return arr[0];
    }
    return arr[0] + recSum(arr.slice(1, arr.length))
}

// const array2 = [1, 2, 3, 4, 5, 6];
// console.log(recSum(array2));


function exponent(base, exp) {
    if (exponent === 0) {
        return 1;
    }
    else if (exp === 1) {
        return base;
    }
    else {
        return base * exponent(base, exp-1);
    }
}

// console.log(exponent(2, 4));

function fibonacci(n) {
    if(n === 1) {
        return [0];
    }
    else if(n === 2) {
        return [0, 1];
    }
    else {
        const prev = fibonacci(n-1);
        return prev.concat([prev[prev.length-1] + prev[prev.length-2]]);
    }
}

// console.log(fibonacci(15));

function deepDup(arr) {
    
}