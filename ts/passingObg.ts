//instead of passing all the param, we can pass using an obj

let drawPoint = (point) => {
	
}
drawPoint ({
	x: 1,
	y: 2,
	z: 3,
	a: 4,
	b: 5,
	c : 6
})




//can define type- inline annotations
let drawPoint = (point: {x: number, y: number}) => {
	
}
drawPoint ({
	x: 1,
	y: 2
})