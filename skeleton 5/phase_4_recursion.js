
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
    // debugger
    if (arr.length===0){
        return -1;
    }
    const mid = parseInt(arr.length/2);
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

// arr=[1,2,3,4,5,6,7,8];
// console.log(bsearch(arr,0));
// console.log(bsearch(arr,2));
// console.log(bsearch(arr,6));
// console.log(bsearch(arr,6.5));
// console.log(bsearch(arr,7));
// console.log(bsearch(arr,8));
// console.log(bsearch(arr,32));

function mergeSort(arr) {
    if (arr.length <= 1) {
        return arr;
    }

    const left = arr.slice(0, parseInt(arr.length/2))
    const right = arr.slice(parseInt(arr.length/2))

    const sortedLeft = mergeSort(left);
    const sortedRight = mergeSort(right);

    return merge(sortedLeft, sortedRight);
}

function merge(arr1, arr2) {
    const merged = [];
    while(arr1.length !== 0 && arr2.length !== 0) {
        if (arr1[0] < arr2[0]) {
            merged.push(arr1.shift)
        }
        else {
            merged.push(arr2.shift)
        }
    }

    return merged;
}


const array4 = [81, 49, 30, 55, 13, 9, 21, -4, 33, 24];
console.log(mergeSort(array4));