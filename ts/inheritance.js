var __extends = (this && this.__extends) || (function () {
    var extendStatics = Object.setPrototypeOf ||
        ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
        function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
    return function (d, b) {
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
var Sports = /** @class */ (function () {
    function Sports(name) {
        this._name = name;
    }
    return Sports;
}());
//To create a subclass we use extends, A class can only extend one class
var Cricket = /** @class */ (function (_super) {
    __extends(Cricket, _super);
    function Cricket(name) {
        // To call the base class member we use super
        return _super.call(this, name) || this;
    }
    return Cricket;
}(Sports));
