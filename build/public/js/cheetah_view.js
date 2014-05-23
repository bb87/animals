// Generated by CoffeeScript 1.7.1
(function() {
  var CheetahView, _,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  _ = window._;

  CheetahView = (function(_super) {
    __extends(CheetahView, _super);

    function CheetahView() {
      this.render = __bind(this.render, this);
      return CheetahView.__super__.constructor.apply(this, arguments);
    }

    CheetahView.prototype.initialize = function() {
      return this;
    };

    CheetahView.prototype.render = function() {
      var type;
      type = this.model.get('type');
      this.$el.text("I am a " + type);
      this.$el.css({
        backgroundColor: '#fc0'
      });
      return this;
    };

    return CheetahView;

  })(Backbone.View);

  window.CheetahView = CheetahView;

}).call(this);
