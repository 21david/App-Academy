function Cat(name, owner) {
    this.name = name;
    this.owner = owner;

}

Cat.prototype.cuteStatement = function() {
    return this.owner + " loves " + this.name;
}

const cat1 = new Cat('mimo', 'david');
const cat2 = new Cat('latte', 'sam');
const cat3 = new Cat('garfield', 'alex');

console.log(cat1.cuteStatement());
console.log(cat2.cuteStatement());
console.log(cat3.cuteStatement());

Cat.prototype.cuteStatement = function() {
    return "Everyone loves " + this.name;
}

console.log(cat1.cuteStatement());
console.log(cat2.cuteStatement());
console.log(cat3.cuteStatement());

cat1.meow = function() {
    return "mrooow"
}

Cat.prototype.meow = function() {
    return "meow"
}

console.log(cat1.meow());
console.log(cat2.meow());
console.log(cat3.meow());