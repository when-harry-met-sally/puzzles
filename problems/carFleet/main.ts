function carFleet(target: number, position: number[], speed: number[]): number {
  const m = position.map((pos, i) => ({
    position: pos,
    speed: speed[i],
    time: (target - pos) / speed[i]
  }));
  const sorted = m.sort((a, b) => b.position - a.position)
  let p = 0
  const l = sorted.length;
  for (let i = 0; i < l - 1; i++) {
    if (m[i].time < m[i + 1].time) {
      p++
    } else {
      m[i + 1].time = m[i].time
    }
  }

  if (l >= 2) {
    if (m[l - 2].time <= m[l - 1].time) {
      p++
    }
  }
  return p || 1;
};



const position = [6, 2, 17]
const speed = [3, 9, 2]
const target = 20
const res = carFleet(target, position, speed)
console.log(res)


function carFleet(target: number, position: number[], speed: number[]): number {
  // Create an array of cars with their position, speed, and calculated time to reach the target
  const cars = position.map((pos, i) => ({
    position: pos,
    speed: speed[i],
    time: (target - pos) / speed[i]
  }));

  // Sort cars by their starting position in descending order
  cars.sort((a, b) => b.position - a.position);

  let fleets = 0;
  let lastFleetTime = 0;

  // Iterate through the sorted list of cars to count fleets
  for (const car of cars) {
    if (car.time > lastFleetTime) {
      // This car forms a new fleet
      fleets++;
      lastFleetTime = car.time;
    }
  }

  return fleets;
}

// Example usage
const target = 10;
const position = [6, 8];
const speed = [3, 2];

console.log(`Number of fleets: ${carFleet(target, position, speed)}`); // Output: 2

// travel at slowest in fleet
// target - position = remainder / speed (time to destination?)

// they are gatekept by the slowest in the front


// i think we sort by completion time, shortest first. 

// if position i < i + 1, they will form a fleet


// short by position, first first...
// if i.time === i +time, fleet, ignore
// if i.time < i+1, ignore
// if i.time > i + 1, fleetize

// TIME TO (DESTINATION) -> TIME TO (FLEET)


// y = x2 + 10
// y = x4 + 8
// y = x1 + 0
// y = x1 + 5
// y = x3 + 3

// fleet one (x + 1)
// fleet two (x + 5, 3x + 3)
// fleet three (4x + 8, 2x + 10)


