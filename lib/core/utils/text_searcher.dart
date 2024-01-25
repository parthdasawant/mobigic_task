
class TextSearcher{
  List<List<int>> findTextInGrid(List<List<String>> grid, String searchText) {
    int rows = grid.length;
    int cols = grid[0].length;
    int len = searchText.length;

    List<List<int>> positions = [];

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        // Check horizontal direction
        if (j + len <= cols &&
            grid[i].sublist(j, j + len).join() == searchText) {
          for (int k = 0; k < len; k++) {
            positions.add([i + k, j + k]);
            grid[i][j + k] = grid[i][j + k].toUpperCase();
          }
        }

        // Check vertical direction
        if (i + len <= rows) {
          bool isMatch = true;
          for (int k = 0; k < len; k++) {
            if (grid[i + k][j] != searchText[k]) {
              isMatch = false;
              break;
            }
          }
          if (isMatch) {
            for (int k = 0; k < len; k++) {
              positions.add([i + k, j]);
              grid[i + k][j] = grid[i + k][j].toUpperCase();
            }
          }
        }

        // Check diagonal direction (top left to bottom right)
        if (i + len <= rows && j + len <= cols) {
          bool isMatch = true;
          for (int k = 0; k < len; k++) {
            if (grid[i + k][j + k] != searchText[k]) {
              isMatch = false;
              break;
            }
          }
          if (isMatch) {
            for (int k = 0; k < len; k++) {
              positions.add([i + k, j + k]);
              grid[i + k][j + k] = grid[i + k][j + k].toUpperCase();
            }
          }
        }
      }
    }

    return positions;
  }

}