const grid1 = [[1,1,1,0,0],[0,1,1,1,1],[0,0,0,0,0],[1,0,0,0,0],[1,1,0,1,1]];
const grid2 = [[1,1,1,0,0],[0,0,1,1,1],[0,1,0,0,0],[1,0,1,1,0],[0,1,0,1,0]];

function countSubIslands(grid1: number[][], grid2: number[][]) {
    
};

const res = countSubIslands(grid1, grid2)

console.log(res)



const getIsland = (grid: number[][], y: number, x: number, checked: any, island: {x: number, y: number}[]) => {
  console.log('cur', {y,x })
  const key = `${y},${x}`
  checked[key] = true;

  console.log(checked);
  // LEFT
  const leftX = x - 1;
  const left = `${y},${leftX}`
  if (leftX >= 0 && !checked[left] && grid[y][leftX] === 1){
    console.log('L')
    island.push({x: leftX, y})
    console.log('left', {y, x: leftX})
    return [{x,y}, ...getIsland(grid, y, leftX, checked, island)]
  }
  // RIGHT
  const rightX = x + 1;
  const right = `${y},${rightX}`
  if (rightX <= grid[y].length && !checked[right] && grid[y][rightX] === 1){
    console.log('R')
    island.push({x: rightX, y})

    console.log('right', {y, x: rightX})
    return [{x,y}, ...getIsland(grid, y, rightX, checked, island)]
  }
  // BOTTOM
  const botY = y - 1;
  const bot = `${botY},${x}`
  if (botY >= 0 && !checked[bot] && grid[botY][x] === 1){
    console.log('B')
    island.push({x, y: botY})
    return [{x,y}, ...getIsland(grid, botY, x, checked, island)]
  }
  // TOP
  const topY = y + 1;
  const top = `${topY},${x}`
  if (topY <= grid[y].length && !checked[top] && grid[topY][x] === 1){
    console.log('T')
    island.push({x, y: topY})
    return [{x,y}, ...getIsland(grid, topY, x, checked, island)]
  }

  return [{x,y}]
}


const getIslands = (grid: number[][]) => {
  const checked = {};
  const islands = [];
    for (let y = 0; y < grid.length; y++){
    for (let x = 0; x < grid[y].length; x++){
      const key = `${y},${x}`
      const val = grid[y][x];
      if (val === 0) {
        continue
      } else {
        const island = getIsland(grid, y, x, checked, [])
        console.log('ISLAND', island)
      }
    }
  }
}

const g = getIslands(grid1);

// console.log(getIsland(grid1, 0, 0, {}, []))


