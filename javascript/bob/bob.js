var Bob = module.exports = function() {
  
  this.hey = function(message) {

    if (!message.trim()) {
      return 'Fine. Be that way!';

    } else if (message === message.toUpperCase() &&
               message !== message.toLowerCase()) {
      return 'Woah, chill out!';

    } else if (message.slice(-1) === '?') {
      return 'Sure.';

    } else {
      return 'Whatever.';
    };
  };
};
