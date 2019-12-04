

/* Day 3
 https://adventofcode.com/2019/day/3
 
 Order does matter for Part 2.
 
 Switch to a List then convert to a Set to perform the intersection.
 
 R75,D30,R83,U83,L12,D49,R71,U7,L72
 U62,R66,U55,R34,D71,R55,D58,R83 = distance 159
 
 R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51
 U98,R91,D20,R16,D67,R40,U7,R15,U6,R7 = distance 135
 
 wire1 = Set[Coords]
 wire2 = Set[Coords]
 
 pointList = wire1 intersects wire2
 
 pointList.map calcManhattanDist.mi
 
 */
import UIKit

public class Day03Part2 {

    enum Direction:Character {
        case up = "U"
        case down = "D"
        case right = "R"
        case left = "L"
    }
    struct Coord:Hashable {
        let row:Int
        let col:Int
    }

    struct WirePart {
        let direction:Direction
        let steps:Int
    }

    public init() {}

    public func part1(wire1:String, wire2:String) -> Int {
        let origin = Coord(row: 0,col: 0)
//        var wireCoords:Set<Coord> = Set([origin])
        
        let wire1Parts = parseWire(wireStr: wire1)
        let wire1CoordsList = drawWire(wire: wire1Parts)
        
        let wire2Parts = parseWire(wireStr: wire2)
        let wire2CoordsList = drawWire(wire: wire2Parts)
        let wire1Coords = Set(wire1CoordsList)
        let wire2Coords = Set(wire2CoordsList)
        
        let intersections = wire1Coords.intersection(wire2Coords)
        
        let distances = intersections.map {manhattanDistance(coord1: origin, coord2: $0)}
        let stepsToIntersectionList = intersections.map {stepsToCoord(coord: $0, wire1List: wire1CoordsList, wire2List: wire2CoordsList)}
        let answer_part2 = stepsToIntersectionList.min() ?? -2
        let answer_part1 = distances.min() ?? -1
        return answer_part2
    }
    
    
    private func stepsToCoord(coord:Coord, wire1List:[Coord], wire2List:[Coord]) -> Int {
        
        let wire1Steps = (wire1List.firstIndex(of: coord) ?? 0) + 1
        
        let wire2Steps = (wire2List.firstIndex(of: coord) ?? 0) + 1
        
        
        return wire1Steps + wire2Steps
    }
    
    
    private func manhattanDistance(coord1:Coord, coord2:Coord) -> Int {
        abs(coord1.row - coord2.row) + abs(coord1.col - coord2.col)
    }
    
    private func moveToWayPoint(start:Coord, wirePart:WirePart) -> (Coord, [Coord] ) {
        var newCoords:[Coord] = []
        var currentRow = start.row
        var currentCol = start.col
        var nextCoord:Coord = start
        
        switch wirePart.direction {
        case .up:
            //
            var nextRow = start.row
            for _ in 1 ... wirePart.steps {
                nextRow += 1
                nextCoord = Coord(row: nextRow, col: start.col)
                newCoords.append(nextCoord)
            }
        case .down:
            //
            var nextRow = start.row
            for _ in 1 ... wirePart.steps {
                nextRow -= 1
                nextCoord = Coord(row: nextRow, col: start.col)
                newCoords.append(nextCoord)
            }
        case .right:
            var nextCol = start.col
            for _ in 1 ... wirePart.steps {
                nextCol += 1
                nextCoord = Coord(row: start.row, col: nextCol)
                newCoords.append(nextCoord)
            }
        case .left:
            var nextCol = start.col
            for _ in 1 ... wirePart.steps {
                nextCol -= 1
                nextCoord = Coord(row: start.row, col: nextCol)
                newCoords.append(nextCoord)
            }
            
            //
        }
//        let n = newCoords.count
        return (nextCoord, newCoords)
    }
    
    private func drawWire(wire:[WirePart]) -> [Coord] {
        var startCoord = Coord(row: 0, col: 0)
        var allCoords:[Coord] = []
        for w in wire {
//            print("\(w)")
            let (nextCoord, nextListCoords) = moveToWayPoint(start: startCoord, wirePart: w)
            startCoord = nextCoord
            //
            
            allCoords.append(contentsOf: nextListCoords)
        }
        
        return allCoords
    }
    
    
    
    private func parseWire(wireStr:String) -> [WirePart] {
        //
        
        let directions = wireStr.split(separator: ",")
        
        let wireList:[WirePart] = directions.map {
            let dir = $0.first ?? "U"
            let steps = $0.dropFirst()
            let dirEnum = Direction(rawValue: dir)
            let stepsNum = Int(steps) ?? 0
            let wirePart = WirePart(direction:dirEnum! , steps: stepsNum)
            return wirePart
        }
        //let letter = wireStr.first
        return wireList
    }
    
    public func loadWires() -> (String, String) {
        let wireList:[String]
        let wire1:String
        let wire2:String
        
        let path = Bundle.main.url(forResource: "input03", withExtension: "txt")
        do {
            
            var text = try String(contentsOf: path!, encoding: .utf8)
            
            wireList = text.components(separatedBy: .whitespacesAndNewlines)//.compactMap({Int($0)})
            wire1 = wireList.first ?? ""
            wire2 = wireList[1]
        } catch {
            
            print(error)
            wireList = []
            wire1 = ""
            wire2 = ""
            // Handle the error
        }
        return (wire1, wire2)
    }
    
}


