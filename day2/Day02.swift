import Foundation

public class Computer {
    
    public var opcodes:[Int] = []
    
    public init() {}
    
    func processOpcodes( _ instructionPointer:Int) {
        
        let opcode = opcodes[instructionPointer]
        
        switch opcode {
        case 1,2: // add, multiply
            
            let memoryPtr1 = opcodes[instructionPointer + 1]
            let memoryPtr2 = opcodes[instructionPointer + 2]
            
            let resultPtr = opcodes[instructionPointer + 3]
            let value1 = opcodes[memoryPtr1]
            let value2 = opcodes[memoryPtr2]
            let result:Int
            
            if opcode == 1 {
                result = value1 + value2
            } else {
                result = value1 * value2
            }
            opcodes[resultPtr] = result
            
            processOpcodes(instructionPointer + 4)
            
        case 99: //halt
            //            print("halt")
            return
        default:
            print("invalid cmd")
        }
    }
    
    public func day02_1(noun:Int, verb:Int) -> Int {
        
        opcodes[1] = noun
        opcodes[2] = verb
        
        processOpcodes(0)
        //        print("\(opcodes)")
        return opcodes[0]
    }
    
}
