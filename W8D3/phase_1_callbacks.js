function titleize(names, func) {
    func(names.map( el => {
        return `Mx. ${el} Jingleheimer Schmidt`
    }))
}

function printCallback(arr) {
    arr.forEach(element => console.log(element) )
}

titleize(["Mary", "Brian", "Leo"], printCallback);
// Mx. Mary Jingleheimer Schmidt
// Mx. Brian Jingleheimer Schmidt
// Mx. Leo Jingleheimer Schmidt