
/*
 
 
 */



//var opcodes = [1,0,0,3,99]

/*
 Once you have a working computer, the first step is to restore the gravity assist program (your puzzle input) to the "1202 program alarm" state it had just before the last computer caught fire. To do this, before running the program, replace position 1 with the value 12 and replace position 2 with the value 2. What value is left at position 0 after the program halts?
 */

//var opcodes = [1,9,10,3,2,3,11,0,99,30,40,50]
//var programCounter = 0

func processOpcodes(_ programCounter:Int) {
    let opcode = opcodes[programCounter]
    //programCounter += 1
    
    switch opcode {
    case 1,2: // add
        print("add") 
        
        let memoryPtr1 = opcodes[programCounter + 1]
        
        let memoryPtr2 = opcodes[programCounter + 2]
        //programCounter += 1
        let resultPtr = opcodes[programCounter + 3]
        let value1 = opcodes[memoryPtr1]
        let value2 = opcodes[memoryPtr2]
        let result:Int
        
        if opcode == 1 {
            result = value1 + value2
        } else {
            result = value1 * value2
        }
        opcodes[resultPtr] = result
        //programCounter += 4
        processOpcodes(programCounter + 4)
        //case 2:
        //print("multiply")
    case 99: //halt
            print("halt")
            return 
    default:
        print("invalid cmd")
    }
    
}
//replace position 1 with the value 12 and replace position 2 with the value 2.
opcodes[1] = 12
opcodes[2] = 2
// 

processOpcodes(0)
print("\(opcodes)")
