console.log("Webpack is working!");

const MovingObject = require("./moving_object.js");
window.MovingObject = MovingObject;

const Util = require("./util.js");
window.Util = Util;

const Asteroid = require("./asteroid.js");
window.Asteroid = Asteroid;

const Game = require("./game.js");
window.Game = Game;

window.addEventListener('DOMContentLoad', () => {
    const canv = document.getElementById("game-canvas")
    canv.width = 500
    canv.height = 500
    const ctx = canv.getContext("2d");
    const mo = new MovingObject({
        pos: [200, 200],
        vel: [1000, 1000],
        radius: 5,
        color: "#00FF00"
    });
    mo.draw();


});
