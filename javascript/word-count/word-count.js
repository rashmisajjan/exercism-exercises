var words = module.exports = function(text) {
  return text
    .toLowerCase()
    .match(/\w+/g)
    .reduce(function(counts, word) {
      counts.hasOwnProperty(word) ? counts[word]++ : counts[word] = 1;
      return counts;
    }, {});
};
