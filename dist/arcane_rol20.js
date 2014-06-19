/* arcane_rol20 - 0.0.1
 * Useful scripts and stuff for Roll20's api
 * https://github.com/anithri/aracne_roll20
 */
(function() {
  this.fpData = null;

  this.apiChatCommands = {};

  this.addChatModule = function(moduleName) {
    return apiChatCommands[moduleName] = [];
  };

  this.addChatCommand = function(moduleName, re, callBackTo) {
    return this.apiChatCommands[moduleName] << {
      re: re,
      callBackTo: callBackTo
    };
  };

  addChatModule("!fp");

  addChatCommand("!fp", /^(show)?\s*$/, function(msg, matchData, who) {
    return log("and here I show my stuff");
  });

  addChatCommand("!fp", /^init\s+(\d+)\s+(\d+)\s*$/, function(msg, matchData, who) {
    var d, dark, light, _ref;
    _ref = matchData.slice(1, 3), dark = _ref[0], light = _ref[1];
    d = "here I do some stuff " + dark + " " + light;
    return log(d);
  });

  this.processApiChatCommand = function(cmd, who) {
    var api, msg, _ref;
    _ref = cmd.split(" ", 2), api = _ref[0], msg = _ref[1];
    if (apiChatCommands[api] == null) {
      return false;
    }
    return log(api);
  };

}).call(this);

(function() {
  var ForcePool;

  this.ForcePool = ForcePool = (function() {
    ForcePool.prototype.lightSidePoints = 0;

    ForcePool.prototype.darkSidePoints = 0;

    ForcePool.prototype.strDark = "0";

    ForcePool.prototype.strLight = "+";

    ForcePool.prototype.showData = function() {
      return Utility.repeat(this.strDark, this.darkSidePoints) + Utility.repeat(this.strLight, this.lightSidePoints);
    };

    function ForcePool(darkSidePoints, lightSidePoints) {
      this.darkSidePoints = darkSidePoints;
      this.lightSidePoints = lightSidePoints;
    }

    ForcePool.prototype.useLight = function(who) {
      if (who == null) {
        who = "TK421";
      }
      if (!(this.lightSidePoints > 0)) {
        return;
      }
      this.lightSidePoints -= 1;
      return this.darkSidePoints += 1;
    };

    ForcePool.prototype.useDark = function(who) {
      if (who == null) {
        who = "TK421";
      }
      if (!(this.darkSidePoints > 0)) {
        return;
      }
      this.lightSidePoints += 1;
      return this.darkSidePoints -= 1;
    };

    return ForcePool;

  })();

}).call(this);

(function() {
  this.Utility = {
    repeat: function(str, count) {
      var pattern, result;
      if (count < 1) {
        return '';
      }
      result = '';
      pattern = str;
      while (count > 1) {
        if (count & 1) {
          result += pattern;
        }
        count >>= 1;
        pattern += pattern;
      }
      return result + pattern;
    }
  };

}).call(this);
