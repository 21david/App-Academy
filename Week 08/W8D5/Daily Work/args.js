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

Function.prototype.myBind = function(context, ...args1) {
    const thisContext = this;
    // const argums = arguments;
    // console.log(argums);
    return function (...args2) {
        // const argums2 = arguments;
        // console.log(argums2);
        let bigArr = args1.concat(args2)
        // console.log(bigArr);
        return thisContext.apply(context, bigArr);
        // return thisContext.call(context, ...bigArr);
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

const mimo = new Cat("Mimo");
const astro = new Dog("Astro");

console.log("1. --------------------");

mimo.says("meow", "David");
// Mimo says meow to David!
// true

console.log("2. --------------------");

console.log(`bind time args are "meow" and "Kush", no call time args`);
mimo.says.myBind(astro, "meow", "Kush")();

console.log(`bind time args are "woof" and "Laura", no call time args`);
const astroAndLaura = mimo.says.bind(astro, "woof", "Laura"); // "woof" and "Laura" are bound to this function
// Astro says meow to Kush!
// true

astroAndLaura();
// Astro says woof to Laura!

console.log("3. --------------------");

console.log(`no bind time args (other than context), call time args are "meow" and "a tree"`);
mimo.says.myBind(astro)("meow", "a tree");
// Astro says meow to a tree!
// true

console.log(`no bind time args (other than context), call time args are [variable] and [variable]`);
const astroSaysAnythingToAnyone = mimo.says.bind(astro);
astroSaysAnythingToAnyone("grrrrr", "a stranger");
astroSaysAnythingToAnyone("mmhh mhhh", "David");
astroSaysAnythingToAnyone("WOOF", "a cat");

console.log("4. --------------------");

console.log('bind time arg is "WOOF", call time arg is "Mimo"');
mimo.says.myBind(astro, "WOOF")("Mimo");
// Astro says meow to mimo!
// true

console.log('bind time arg is "WOOF", call time arg is [variable]');
const astroSaysWOOFToAnyone = mimo.says.bind(astro, "WOOF");
astroSaysWOOFToAnyone("someone walking by");
astroSaysWOOFToAnyone("another dog");
astroSaysWOOFToAnyone("a cat");

console.log("5. --------------------");

// no bind time args (other than context), call time args are [variable] and [variable]
// (same as #3 above)
const astroSays = mimo.says.myBind(astro);
astroSays("yooo", "a stranger");
// Astro says yooo to a stranger!
// true