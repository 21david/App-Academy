const Game = require("./game");

function GameView(game, ctx) {
    this.game = game;
    this.ctx = ctx;
}

GameView.prototype.start = function() {
    // setInterval(function() {
        this.game.moveObjects();
        this.game.draw();
    // }, 200);
}

module.exports = GameView;