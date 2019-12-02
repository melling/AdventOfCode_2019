import UIKit

/*
Specifically, to find the fuel required for a module, take its mass, divide by three, round down, and subtract 2.
*/
func calcFuel(_ mass:Int) -> Int {mass / 3 - 2}


let f0 = calcFuel(12)

let path = Bundle.main.url(forResource: "input01", withExtension: "txt")
var text = try String(contentsOf: path!, encoding: .utf8)

let massList:[Int] = text.components(separatedBy: .whitespacesAndNewlines).compactMap({Int($0)})

let solution1 = massList.map({$0 / 3 - 2}).reduce(0, +)
print("\(solution1)")


/* Part 2
 A module of mass 14 requires 2 fuel. This fuel requires no further fuel (2 divided by 3 and rounded down is 0, which would call for a negative fuel), so the total fuel required is still just 2.
 At first, a module of mass 1969 requires 654 fuel. Then, this fuel requires 216 more fuel (654 / 3 - 2). 216 then requires 70 more fuel, which requires 21 fuel, which requires 5 fuel, which requires no further fuel. So, the total fuel required for a module of mass 1969 is 654 + 216 + 70 + 21 + 5 = 966.
 The fuel required by a module of mass 100756 and its fuel is: 33583 + 11192 + 3728 + 1240 + 411 + 135 + 43 + 12 + 2 = 50346.
 */

func calcFuel2(_ mass:Int) -> Int {
    if mass <= 0 {
        return 0
    }
    let requiredFuel = max(mass / 3 - 2,0)
    print("\(requiredFuel)")
    return requiredFuel + calcFuel2(requiredFuel)
}
let z0 = calcFuel2(100756)
let solution2 = massList.map(calcFuel2).reduce(0, +)
print("\(solution2)")
