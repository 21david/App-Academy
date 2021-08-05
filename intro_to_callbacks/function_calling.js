Function.prototype.myBind = function(context) {

    return () => {
        // Function.prototype.apply
        this.apply(context)
    }
}


class Lamp {
    constructor() {
        this.name = "a lamp";
    }
}

const turnOn = function() {
    console.log("Turning on " + this.name);
};

const lamp = new Lamp();

turnOn(); // should not work the way we want it to

const boundTurnOn = turnOn.bind(lamp);
const myBoundTurnOn = turnOn.myBind(lamp);

boundTurnOn(); // should say "Turning on a lamp"
myBoundTurnOn(); // should say "Turning on a lamp"


Function.prototype.myThrottle = function(interval) {
    let tooSoon = 
    if(!tooSoon) {
        tooSoon = true;
        setTimeout(function() {
            tooSoon = false;
        }, interval);
    }



    return () => {}
}