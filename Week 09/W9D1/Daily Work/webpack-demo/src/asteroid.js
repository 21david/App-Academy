const Util = require('./util');
const MovingObject = require('./moving_object');
// const Game = require('./game');

const COLOR = "red";
const RADIUS = 10;

function Asteroid(obj) {
    // super(obj)
    this.pos = obj.pos;
    this.radius = RADIUS;
    this.color = COLOR;
    this.vel = Util.randomVec(5);
}
// Asteroid.inherits(Util);
Util.inherits(Asteroid, MovingObject);


module.exports = Asteroid;