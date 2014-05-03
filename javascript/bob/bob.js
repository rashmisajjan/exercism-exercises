var Bob = module.exports = function() {
  
  this.hey = function(message) {
    if (!message.trim) {
      return 'Fine. Be that way!';
    } else if (message === message.toUpperCase()) {
      return 'Woah, chill out!';
    } else if (message[message.length - 1] === '?') {
      return 'Sure.';
    } else {
      return 'Whatever.';
    };
  };
};
