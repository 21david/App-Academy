
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
    const dup = [];
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] instanceof Array) {
            dup.push(deepDup(arr[i]));
        } else {
            dup.push(arr[i]);
        }
    }
    return dup
}

// array3=[1,2,[[3,4],5],6];
// arr1 = deepDup(array3);
// array3[0]=2;
// console.log(arr1)
// console.log(array3)


function bsearch(arr,target){
    if (arr.length===0){
        return -1;
    }
    const mid = arr.length/2;
    if(arr[mid]===target){
        return mid;
    }
    else if(arr[mid]<target){
        let results = bsearch(arr.slice(mid+1),target);
        if (results < 0){
            return -1;
        } else{
            return mid + 1 + results;
        }
    } else{
        return bsearch(arr.slice(0,mid),target);
    }
}

arr=[1,2,3,4,5,6,7,8];
console.log(bsearch(arr,5));