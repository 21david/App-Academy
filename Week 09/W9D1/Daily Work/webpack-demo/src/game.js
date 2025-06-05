const MovingObject = require('./moving_object');
const Asteroid = require('./asteroid');

// const canvas = document.getElementById("game-canvas");
const DIM_X = 500;
const DIM_Y = 500;

const NUM_ASTEROIDS = 10; 
const asteroids = [];

function Game() {

}

Game.prototype.addAsteroids = function(){
    for(let i = 0; i < NUM_ASTEROIDS; i++){
        const obj = new MovingObject({pos: this.randomPosition(), vel: [10, 10], radius: 1, color: "red" }); 
        const ast = new Asteroid(obj);
        asteroids.push(ast);
        // debugger
        // ast.draw(); 
    }
};

Game.prototype.randomPosition = function(){

    const x = Math.random() * DIM_X;
    const y = Math.random() * DIM_Y;

    return [x, y];
};

Game.prototype.draw = function(ctx){
    var c = document.getElementById("game-canvas");
    var ctx = c.getContext("2d");
    ctx.clearRect(0, 0, DIM_X, DIM_Y); 
    this.addAsteroids();
    asteroids.forEach(ele => ele.draw());
}

Game.prototype.moveObjects = function(){
    asteroids.forEach(ele => ele.move());
}

module.exports = Game;