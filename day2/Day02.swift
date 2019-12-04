import UIKit
import PlaygroundSupport

let page = PlaygroundPage.current
page.needsIndefiniteExecution = true

//var opcodes = [1,0,0,3,99]

/*
 Once you have a working computer, the first step is to restore the gravity assist program (your puzzle input) to the "1202 program alarm" state it had just before the last computer caught fire. To do this, before running the program, replace position 1 with the value 12 and replace position 2 with the value 2. What value is left at position 0 after the program halts?
 */


class Day02 {
    
    private func loadOpcodes() -> [Int] {
        let opcodeList:[Int]
        
        let path = Bundle.main.url(forResource: "input02", withExtension: "txt")
        do {
            
            let text = try String(contentsOf: path!, encoding: .utf8)
            
            opcodeList = text.components(separatedBy:",").compactMap({Int($0)})
        } catch {
            
            print(error)
            opcodeList = []
            // Handle the error
        }
        return opcodeList
        
        
    }
    
    //replace position 1 with the value 12 and replace position 2 with the value 2.
    
    
    private func validate(noun:Int, verb:Int) -> Int {100 * noun + verb}
    
    private func findNounAndVerb(opcodes:[Int], result:Int) -> (Int,Int){
        //
        let computer = Computer()
        
        computer.opcodes = opcodes
        
        for noun in 0 ... 99 {
            //        print("noun=\(noun)")
            for verb in 0 ... 99 {
                computer.opcodes = opcodes
                let result1 = computer.day02_1(noun: noun, verb: verb)
                if result == result1 {
                    return (noun, verb)
                }
            }
        }
        return (-1, -1)
    }
    
    public func part1_2() {
        var opcodes:[Int] = []
        //opcodes = [1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,10,1,19,1,19,5,23,1,23,9,27,2,27,6,31,1,31,6,35,2,35,9,39,1,6,39,43,2,10,43,47,1,47,9,51,1,51,6,55,1,55,6,59,2,59,10,63,1,6,63,67,2,6,67,71,1,71,5,75,2,13,75,79,1,10,79,83,1,5,83,87,2,87,10,91,1,5,91,95,2,95,6,99,1,99,6,103,2,103,6,107,2,107,9,111,1,111,5,115,1,115,6,119,2,6,119,123,1,5,123,127,1,127,13,131,1,2,131,135,1,135,10,0,99,2,14,0,0]
        //var opcodes = [1,9,10,3,2,3,11,0,99,30,40,50]
        
        let computer = Computer()
        opcodes = loadOpcodes()
        computer.opcodes = opcodes
        
        // 4945026
        let result1 = computer.day02_1(noun: 12, verb: 2)
        let validate1 = validate(noun: 12, verb: 2)
        // Part 2
        let (noun, verb) = findNounAndVerb(opcodes: opcodes, result: 19690720 )
        // 19690720
        let validate2 = validate(noun: noun, verb: verb)
        print("\(noun), \(verb) => \(validate2)")
    }
}

let day02 = Day02()
day02.part1_2()

