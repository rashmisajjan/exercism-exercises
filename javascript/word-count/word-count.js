var words = module.exports = function(text) {

  var result = {};

  text.toLowerCase().split(/\W+/).filter(Boolean).forEach(function(word) {
    if (result.hasOwnProperty(word)) {
      result[word]++;
    } else {
      result[word] = 1;
    }
  });

  return result;
};
