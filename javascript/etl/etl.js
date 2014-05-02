var transform = module.exports = function(scoresObj) {
  var result = {};
  Object.keys(scoresObj).forEach(function(score) {
    scoresObj[score].forEach(function(letter) {
      result[letter.toLowerCase()] = parseInt(score);
    });
  });
  return result;
};
