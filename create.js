// Function.prototype.inherits = function (parent) {
//     var Surrogate = function () { };
//     Surrogate.prototype = parent.prototype;
//     this.prototype = new Surrogate();
//     this.prototype.constructor = this;
// }

function MovingObject() { }
MovingObject.prototype.getSpeed = function () {
    console.log('Current speed is 2.');
}

function Ship() { }
Ship.prototype = Object.create(MovingObject.prototype);
Ship.prototype.constructor = Ship;
Ship.prototype.isSinking = function () {
    console.log(false);
}


function Asteroid() { }
Asteroid.prototype = Object.create(MovingObject.prototype);
Asteroid.prototype.constructor = Asteroid;
Asteroid.prototype.hitShip = function () {
    console.log('Asteroid hits ship.')
}


const s = new Ship();
// console.log(s.__proto__.__proto__);

const a = new Asteroid();
// console.log(a.__proto__.__proto__);

// console.log(Ship.prototype);
// console.log(Ship.prototype.__proto__);

const m = new MovingObject();

// m.getSpeed();
// s.getSpeed();
// a.getSpeed();

// m.isSinking();
// s.isSinking();
// a.isSinking();

// m.hitShip();
// s.hitShip();
a.hitShip();