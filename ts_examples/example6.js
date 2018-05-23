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
var Adder = /** @class */ (function () {
    function Adder(a) {
        var _this = this;
        this.a = a;
        // This function is now safe to pass around
        this.add = function (b) {
            return _this.a + b;
        };
    }
    return Adder;
}());
var ExtendedAdder = /** @class */ (function (_super) {
    __extends(ExtendedAdder, _super);
    function ExtendedAdder() {
        var _this = _super !== null && _super.apply(this, arguments) || this;
        // Create a copy of parent before creating our own
        _this.superAdd = _this.add;
        // Now create our override
        _this.add = function (b) {
            return _this.superAdd(b);
        };
        return _this;
    }
    return ExtendedAdder;
}(Adder));
