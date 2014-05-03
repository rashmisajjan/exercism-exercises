var Matrix = module.exports = function(matrixString) {

  this.rows = matrixString.split('\n').map(function(rowString) {
    return rowString.split(' ').map(Number);
  });

  this.columns = this.rows[0].map(function(val, j) {
    return this.rows.map(function(row) {
      return row[j];
    });
  }, this);
};
