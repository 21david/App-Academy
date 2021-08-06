// SUMS

function sum(...nums){
    // console.log(nums);
    let sum = 0 
    for (let i = 0; i < nums.length; i++) {
        sum += nums[i];
    }
    return sum; 
}

// console.log(sum(1, 345, 5, 2, 12));

function sum2(){
    let sum = 0
    for (let i = 0; i < arguments.length; i++) {
        sum += arguments[i];
    }
    return sum;
}

// console.log(sum2(1, 345, 5, 2, 12));

Function.prototype.myBind = function() {
    const thisContext = this;
    const argums = arguments;
    console.log(argums);
    return function () {
        const argums2 = arguments;
        console.log(argums2);
        return thisContext;
    };
}

class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true

console.log("--------------------");

// no bind time args (other than context), call time args are "meow" and "a tree"
markov.says.myBind(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

console.log("--------------------");

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

console.log("--------------------");

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true