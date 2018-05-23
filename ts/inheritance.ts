class Sports {
    private _name : string;
    constructor(name:string){
       this._name = name;
    }
}
//To create a subclass we use extends, A class can only extend one class
class Cricket extends Sports {
    constructor(name:string){
                 // To call the base class member we use super
       super(name);
    }
}