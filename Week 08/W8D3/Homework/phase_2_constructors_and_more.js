function Elephant(name, height, tricks) {
    this.name = name;
    this.height = height;  // in inches
    this.tricks = tricks;  // array of tricks in gerund form ("painting a picture", ...)
}

Elephant.prototype.trumpet = function() {
    // have to use 'this.name' instead of 'name'
    console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!`)
}

Elephant.prototype.grow = function() {
    this.height += 12;
}

Elephant.prototype.addTrick = function(trick) {
    this.tricks.push(trick)
}

Elephant.prototype.play = function() {
    trick_index = Math.floor(Math.random() * this.tricks.length);
    trick = this.tricks[trick_index];
    console.log(`${this.name} is ${trick}!`)
}



// Testing
const ele1 = new Elephant('Billy', 60, ['rolling over (0)', 'jumping (1)', 'lifting his back legs (2)']);
const ele2 = new Elephant('Gerard', 78, ['sitting (0)', 'doing a hoola hoop dance (1)', 'talking (2)']);

ele1.trumpet();
ele2.trumpet();

console.log(ele1);
ele1.grow();
console.log(ele1);

ele1.grow();
console.log(ele1);

ele1.addTrick('jumping through a loop (3)');

for(let i = 0; i < 10; i++) {
    ele1.play();
}

for(let i = 0; i < 10; i++) {
    ele2.play();
}