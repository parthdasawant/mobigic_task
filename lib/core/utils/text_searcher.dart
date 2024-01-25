
class TextSearcher{
  static List<List<int>> findTextInGrid(List<List<String>> grid, String searchText) {
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
  static List<int> searchTextInMatrix(List<List<String>> matrix, String text) {
    final rows = matrix.length;
    final columns = matrix[0].length;

    // Function to check for a match diagonally from top left to bottom right
    bool checkDiagonal(int row, int col) {
      final length = text.length;
      if (row + length > rows || col + length > columns) return false;
      for (int i = 0; i < length; i++) {
        if (matrix[row + i][col + i] != text[i]) return false;
      }
      return true;
    }

    final positions = <int>[];

    // Horizontal search
    for (int row = 0; row < rows; row++) {
      for (int col = 0; col <= columns - text.length; col++) {
        if (matrix[row].sublist(col, col + text.length).join() == text) {
          positions.addAll(List.generate(text.length, (i) => row * columns + col + i));
        }
      }
    }

    // Vertical search
    for (int col = 0; col < columns; col++) {
      for (int row = 0; row <= rows - text.length; row++) {
        final verticalString = List.generate(text.length, (i) => matrix[row + i][col]).join();
        if (verticalString == text) {
          positions.addAll(List.generate(text.length, (i) => (row + i) * columns + col));
        }
      }
    }

    // Diagonal search (top left to bottom right)
    for (int row = 0; row <= rows - text.length; row++) {
      for (int col = 0; col <= columns - text.length; col++) {
        if (checkDiagonal(row, col)) {
          positions.addAll(List.generate(text.length, (i) => (row + i) * columns + col + i));
        }
      }
    }

    return positions;
  }
}