// Copy and paste this code into console in Chome Dev Tools
// (Windows: F12 to open dev tools, Esc to open console)

function hammerTime(time) {
    // callback function has access to 'time'
    // "Notice that the callback function closed over the time variable in the outer scope of hammerTime"
    window.setTimeout(() => alert(`${time} is hammertime!`), time);
}

hammerTime(3000);