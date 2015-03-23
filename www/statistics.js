var exec = require('cordova/exec');

exports.beginLogPageView = function(name, success, error) {
    exec(success, error, "statistics", "beginLogPageView", [name]);
};

exports.endLogPageView = function(name, success, error) {
    exec(success, error, "statistics", "endLogPageView", [name]);
};

exports.event = function(name, label, success, error) {
    exec(success, error, "statistics", "event", [name, label]);
};
