//: [Previous](@previous)
import PlaygroundSupport

let page = PlaygroundPage.current
page.needsIndefiniteExecution = true


/* Day 3
 https://adventofcode.com/2019/day/3
 
 R75,D30,R83,U83,L12,D49,R71,U7,L72
 U62,R66,U55,R34,D71,R55,D58,R83 = distance 159
 
 R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51
 U98,R91,D20,R16,D67,R40,U7,R15,U6,R7 = distance 135
 
 wire1 = Set[Coords]
 wire2 = Set[Coords]
 
 pointList = wire1 intersects wire2
 
 pointList.map calcManhattanDist.mi
 
 */


print("Starting")
let day3 = Day03()

let (wire1, wire2) = day3.loadWires()

let t1 = day3.part1(wire1: "R8,U5,L5,D3", wire2: "U7,R6,D4,L4") // 6
let t2 = day3.part1(wire1:"R75,D30,R83,U83,L12,D49,R71,U7,L72" , wire2: "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7") // 156
let t3 = day3.part1(wire1:"R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51",
                    wire2: "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7") // 135
print("Done testing")
let answer1 = day3.part1(wire1: wire1, wire2: wire2)
print("answer 1=\(answer1)")
//wires.count
print("Done...")


let day3_2 = Day03Part2()
let t21 = day3_2.part1(wire1: "R8,U5,L5,D3", wire2: "U7,R6,D4,L4") //p1= 6, p2 = 30
let t22 = day3_2.part1(wire1:"R75,D30,R83,U83,L12,D49,R71,U7,L72" , wire2: "U62,R66,U55,R34,D71,R55,D58,R83") // p1=156, 610
let t23 = day3_2.part1(wire1:"R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51",
                    wire2: "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7") // 135, 410

//let (wire1_2, wire2_2) = day3_2.loadWires()
let answer2 = day3_2.part1(wire1: wire1, wire2: wire2)
print("answer 2=\(answer2)")

//wires.count
print("Done...")
