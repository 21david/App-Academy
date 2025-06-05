function MovingObject(obj){
    this.pos = obj["pos"];
    this.vel = obj["vel"];
    this.radius = obj["radius"];
    this.color = obj["color"];
};

module.exports = MovingObject;

MovingObject.prototype.draw = function(ctx){
    var c = document.getElementById("game-canvas");
    var ctx = c.getContext("2d");
    ctx.beginPath();
    ctx.arc(this.pos[0], this.pos[1], 50, 0, 2 * Math.PI, true);
    ctx.fillStyle = "green"; 
    ctx.fill();
    ctx.stroke();
}

MovingObject.prototype.move = function(){
    // console.log("In MOVE");
    const newPos = [this.pos[0] + this.vel[0], this.pos[1] + this.vel[1]];
    this.pos = newPos; 
}