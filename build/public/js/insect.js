// Generated by CoffeeScript 1.7.1
(function() {
  var Insect, _,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  _ = window._;

  Insect = (function(_super) {
    __extends(Insect, _super);

    function Insect() {
      return Insect.__super__.constructor.apply(this, arguments);
    }

    Insect.prototype.initialize = function() {
      Animal.prototype.initialize.apply(this, arguments);
      this._log("I am a Insect, yo");
      return this;
    };

    Insect.prototype.defaults = function() {
      return {
        type: 'insect',
        legs: 6
      };
    };

    Insect.prototype.hasFur = function() {
      return false;
    };

    Insect.prototype.hasExoSkeleton = function() {
      return true;
    };

    return Insect;

  })(window.Animal);

  window.Insect = Insect;

}).call(this);