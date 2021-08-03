Array.prototype.myEach = function(callback) {
    for(let i = 0; i < this.length; i++) {
       callback(this[i]);
    }
}

// const array = [1,2,3,4,5];
// console.log(array.myEach(function(el) { return el + 1 }));


Array.prototype.myMap = function(callback) {
    const array = [];
    for(let i = 0; i < this.length; i++) {
        array.push(callback(this[i]));
    }
    return array;
}

// const array = [1,2,3,4,5];
// console.log(array.myEach(function(el) { return el + 1 }));



Array.prototype.myReduce = function(callback, initialValue) {
    if(initialValue) {
        this.unshift(initialValue);
    }
    let accum = this[0];
    for(let i = 1; i < this.length; i++) {
        accum = callback(accum, this[i]);
    }
    return accum;
}

const array = [1, 2, 3, 4];
console.log(array.myReduce(function(el1, el2) { return el1 * el2 }, 4));