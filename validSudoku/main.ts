const getQ = (x: number, y: number) => {
  const qr = Math.floor(x / 3);
  const qc = Math.floor(y / 3);

  // Calculate the quadrant number
  return 3 * qr + qc;
}

function isValidSudoku(board: string[][]): boolean {
  const rows = {}
  const columns = {}
  const quads = {}
  for (let y = 0; y < board.length; y++) {
    for (let x = 0; x < board.length; x++) {
      const val = board[y][x];
      if (val === ".") {
        continue;
      }
      if (rows[x]) {
        if (rows[x][val]) {
          return false;
        } else {
          rows[x][val] = true
        }
      } else {
        rows[x] = {
          [val]: true
        }
      }

      if (columns[y]) {
        if (columns[y][val]) {
          return false;
        } else {
          columns[y][val] = true
        }
      } else {
        columns[y] = {
          [val]: true
        }
      }

      const q = getQ(x, y)
      if (quads[q]) {
        if (quads[q][val]) {
          return false;
        } else {
          quads[q][val] = true
        }
      } else {
        quads[q] = {
          [val]: true
        }
      }
    }
  };
  return true;
}

const sod = isValidSudoku(
  [["5", "3", ".", ".", "7", ".", ".", ".", "."]
    , ["6", ".", ".", "1", "9", "5", ".", ".", "."]
    , [".", "9", "8", ".", ".", ".", ".", "6", "."]
    , ["8", ".", ".", ".", "6", ".", ".", ".", "3"]
    , ["4", ".", ".", "8", ".", "3", ".", ".", "1"]
    , ["7", ".", ".", ".", "2", ".", ".", ".", "6"]
    , [".", "6", ".", ".", ".", ".", "2", "8", "."]
    , [".", ".", ".", "4", "1", "9", ".", ".", "5"]
    , [".", ".", ".", ".", "8", ".", ".", "7", "9"]])

// I looked up the best way to find a sudoku quadrant.

