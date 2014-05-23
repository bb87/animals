// Generated by CoffeeScript 1.7.1
(function() {
  var AnimalView, _,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  _ = window._;

  AnimalView = (function(_super) {
    __extends(AnimalView, _super);

    function AnimalView() {
      this.render = __bind(this.render, this);
      return AnimalView.__super__.constructor.apply(this, arguments);
    }

    AnimalView.prototype.initialize = function() {
      return this;
    };

    AnimalView.prototype.render = function() {
      var type;
      type = this.model.get('type');
      this.$el.text("I am a " + type);
      return this;
    };

    return AnimalView;

  })(Backbone.View);

  window.AnimalView = AnimalView;

}).call(this);
