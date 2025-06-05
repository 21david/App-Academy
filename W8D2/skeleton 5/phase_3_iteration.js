Array.prototype.bubbleSort = function() {
    let sorted =false;
    while(!sorted){
        sorted=true;
        for(let i=0;i<this.length-1;i++){
            if (this[i+1]<this[i]){
                let temp = this[i];
                this[i]=this[i+1];
                this[i+1]=temp;
                sorted=false;
            }
        }
    }
    return this;
}

String.prototype.substrings = function() {
    const substrings = [];
    for(let i=0; i < this.length - 1; i++){
        for (let j = i+1; j < this.length; j++){
            substrings.push(this.substring(i,j))
        }
    }
    return substrings;
}

// const array=[1,4,6,2,3,43,9,54,4,51];
// console.log(array.bubbleSort());

// const string = ""
// console.log(string.substrings())

