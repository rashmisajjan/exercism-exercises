var transform = module.exports = function(scoresObj) {
  var result = {};
  Object.keys(scoresObj).forEach(function(scoreStr) {
    var score = +scoreStr;
    scoresObj[scoreStr].forEach(function(letter) {
      result[letter.toLowerCase()] = score;
    });
  });
  return result;
};
