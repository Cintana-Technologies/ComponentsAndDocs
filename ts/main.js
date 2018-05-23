//just a function
function log(message) {
    console.log(message);
}
var message = 'hello world';
log(message);
//declarations
function doSomething() {
    for (var i = 0; i < 5; i++) {
        console.log(i);
    }
    console.log('finally:' + i);
}
doSomething();
