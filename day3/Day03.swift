import UIKit

/*
 
 Walk the path for each wire, placing each coordinate into a Coord set for the wire.
 
 All we need is the coordinates for each wire, and do a simple Set intersection to find where they cross.
 
 Order does not matter... At least we don't think that at this point. :-(
 */
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


public class Day03 {
    
    public init() {}
    
    public func part1(wire1:String, wire2:String) -> Int {
        let origin = Coord(row: 0,col: 0)
        //        var wireCoords:Set<Coord> = Set([origin])
        
        let wire1Parts = parseWire(wireStr: wire1)
        let wire1Coords = drawWire(wire: wire1Parts)
        
        let wire2Parts = parseWire(wireStr: wire2)
        let wire2Coords = drawWire(wire: wire2Parts)
        
        let intersections = wire1Coords.intersection(wire2Coords)
        let distances = intersections.map {manhattanDistance(coord1: origin, coord2: $0)}
        let answer = distances.min() ?? -1
        return answer
    }
    
    private func manhattanDistance(coord1:Coord, coord2:Coord) -> Int {
        abs(coord1.row - coord2.row) + abs(coord1.col - coord2.col)
    }
    
    private func moveToWayPoint(start:Coord, wirePart:WirePart) -> (Coord, Set<Coord> ) {
        var newCoords:Set<Coord> = Set()
        //        var currentRow = start.row
        //        var currentCol = start.col
        var nextCoord:Coord = start
        
        switch wirePart.direction {
        case .up:
            //
            var nextRow = start.row
            for _ in 1 ... wirePart.steps {
                nextRow += 1
                nextCoord = Coord(row: nextRow, col: start.col)
                newCoords.insert(nextCoord)
            }
        case .down:
            //
            var nextRow = start.row
            for _ in 1 ... wirePart.steps {
                nextRow -= 1
                nextCoord = Coord(row: nextRow, col: start.col)
                newCoords.insert(nextCoord)
            }
        case .right:
            var nextCol = start.col
            for _ in 1 ... wirePart.steps {
                nextCol += 1
                nextCoord = Coord(row: start.row, col: nextCol)
                newCoords.insert(nextCoord)
            }
        case .left:
            var nextCol = start.col
            for _ in 1 ... wirePart.steps {
                nextCol -= 1
                nextCoord = Coord(row: start.row, col: nextCol)
                newCoords.insert(nextCoord)
            }
            
            //
        }
//        let n = newCoords.count
        return (nextCoord, newCoords)
    }
    
    private func drawWire(wire:[WirePart]) -> Set<Coord> {
        var startCoord = Coord(row: 0, col: 0)
        var allCoords:Set<Coord> = Set()
        for w in wire {
            //            print("\(w)")
            let (nextCoord, nextSetCoords) = moveToWayPoint(start: startCoord, wirePart: w)
            startCoord = nextCoord

            allCoords = allCoords.union(nextSetCoords)
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
        //        let wireList:[String]
        let wire1:String
        let wire2:String
        
        let path = Bundle.main.url(forResource: "input03", withExtension: "txt")
        do {
            
            let text = try String(contentsOf: path!, encoding: .utf8)
            
            let wireList = text.components(separatedBy: .whitespacesAndNewlines)//.compactMap({Int($0)})
            wire1 = wireList.first ?? ""
            wire2 = wireList[1]
        } catch {
            
            print(error)
            //            wireList = []
            wire1 = ""
            wire2 = ""
            // Handle the error
        }
        return (wire1, wire2)
    }
    
}

