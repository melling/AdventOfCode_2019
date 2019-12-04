import Foundation


public class Day04 {
    
    public init() {}

    public func test(num:Int) -> Bool {
        let str = String(num)
        let digits:[Int] = str.map(String.init).flatMap(Int.init)
        return testAllPredicates(digits: digits)
    }
    
    public func testAllPredicates(digits:[Int]) -> Bool {
        if digits.count != 6 {return false}
        
        let twoSamePred:[Bool] = digits.enumerated().map( { (index, elem) in
            let isSame =  (index > 0) && (digits[index - 1]) == elem ? true : false
            return isSame
            
        })
        
        let greaterEqualPred:[Bool] = digits.enumerated().map( { (index, elem) in
            let isGreater =  (index > 0) && (digits[index - 1]) <= elem ? true : false
            return isGreater
        })
        let isTwoEqual = twoSamePred.contains(true)
        let allGreaterEqual = !greaterEqualPred.dropFirst().contains(false)
        
        return isTwoEqual && allGreaterEqual
    }
    
    public func part0() -> Int {
        var cnt = 0
        for i in 130254 ... 678275 {
            if test(num: i) {
                cnt += 1
            }
        }
        return cnt
    }
    
    public func part1() -> Int {
        let n = (130254...678275).map(test).filter {$0}.count
//        let n = (130254...140260).map(test).filter {$0}.count
        return n
    }
}

let day04 = Day04()
let t1 = day04.test(num: 111111) // true

let t2 = day04.test(num: 223450) // false
let t3 = day04.test(num: 123789) // false
let result1 = day04.part1()
print("result1=\(result1)") // 2090

