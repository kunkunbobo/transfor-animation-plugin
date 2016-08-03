var exec = require('cordova/exec');


module.exports = {
    
    transition: function(animationType,duration,resultCallback) {
        exec(resultCallback, null, "YZWTransitionAnimation", "transition", [animationType, duration]);
    },
    
    pushAnimation: function(resultCallback) {
        exec(resultCallback, null, "YZWTransitionAnimation", "pushAnimation", []);
   },
    
    backAnimation: function(resultCallback) {
        exec(resultCallback, null, "YZWTransitionAnimation", "backAnimation", []);
    },
    
    presentAnimation: function(resultCallback) {
        exec(resultCallback, null, "YZWTransitionAnimation", "presentAnimation", []);
    },

    dismissAnimation: function(resultCallback) {
        exec(resultCallback, null, "YZWTransitionAnimation", "dismissAnimation", []);
    },
};
