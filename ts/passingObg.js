//instead of passing all the param, we can pass using an obj
var drawPoint = function (point) {
};
drawPoint({
    x: 1,
    y: 2,
    z: 3,
    a: 4,
    b: 5,
    c: 6
});
//can define type- inline annotations
var drawPoint = function (point) {
};
drawPoint({
    x: 1,
    y: 2
});
