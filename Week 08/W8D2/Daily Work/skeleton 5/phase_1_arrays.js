
Array.prototype.uniq=function(){
    const uniqVals = [];
    for(let i=0;i<this.length;i++){
        if (!uniqVals.includes(this[i])){
            uniqVals.push(this[i]);
        }
    }
    return uniqVals;
    // console.log(this);
}

// const arr=[1,2,3,3,4,4,4,5];
// console.log(arr.uniq());

Array.prototype.twoSum=function(){
    const pairs= [];
    for(let r=0;r<this.length;r++){
        for (let c = 0; c < this.length; c++) {
            if(c>r && this[c]+this[r]==0){
                pairs.push([r,c]);
            }
        }
    }
    return pairs;
}

// const arr = [1, 2, 3, -3, 4, -4, 4, 5];
// console.log(arr.twoSum());

Array.prototype.transpose=function(){
    const rows=this.length;
    const cols=this[0].length;
    const transpose = [];
    for (let r = 0; r < cols; r++) {
        const currentRow=[];
        for (let c = 0; c < rows; c++) {
            currentRow.push(this[c][r])
        }
        transpose.push(currentRow);
    }
    return transpose;
}

// const arr = [[1, 2, 3], 
//             [-3, 4, -4], 
//             [4, 5, 2] ,
//             [1 ,1 ,1 ] ];
// console.log(arr.transpose());


