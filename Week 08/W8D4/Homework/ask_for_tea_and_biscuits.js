const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


let teaResponse = '';
let tea = false;
reader.question("Want tea?\n", (resp) => {
    teaResponse = resp;
    teaResponseFun();
    askBiscuits();
});

function teaResponseFun() {
    if (teaResponse.toLowerCase().includes("yes")) {
        console.log("So you do want tea.");
        tea = true;
    } else {
        console.log("So you don't want tea, is what I understood.");
    }
}


let biscResponse = '';
let bisc = false;
function askBiscuits() {
    
    reader.question("Want biscuits?\n", (resp) => {
        biscResponse = resp;
        biscResponseFun();
        printFinalResponse();
    });
}

function biscResponseFun() {
    if (biscResponse.toLowerCase().includes("yes")) {
        console.log("So you do want biscuits.");
        bisc = true;
    } else {
        console.log("So you don't want biscuits, is what I understood.");
    }
}

function printFinalResponse() {

    console.log();
    
    if(bisc || tea) {
        console.log(`Cool. So you${tea ? '' : " don't"} want tea and you${bisc ? '' : " don't"} want biscuits.`);
        console.log("I'll get that for you right away. That'll be $5.");
    } else {
        console.log("Okay, you don't want anything. Let me know if you change your mind.");
    }
    console.log();

    reader.close();
}

// reader.close();