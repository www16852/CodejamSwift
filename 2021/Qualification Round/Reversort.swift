//
//  main.swift
//  Round1-1
//
//  Created by cm0673 on 2021/4/1.
//

import Foundation

let input = """
3
4
4 2 1 3
2
1 2
7
7 6 5 4 3 2 1
"""
var lines = input.components(separatedBy: "\n")
print(lines)
func readLine() -> String? {
    let firstStr = lines.first
    lines.remove(at: 0)
    return firstStr
}

func getIntegersOf(line: String, separatedBy separator: String) -> [Int] {
    let stringArray = line.components(separatedBy: separator)
    return stringArray.map { Int($0)! }
}

func reverse(inputs: [Int], _ sIndex: Int, _ eIndex: Int) -> [Int] {
    var result = inputs
    for i in 0..<result.count{
        let v = inputs[i]
        if i>=sIndex, i<=eIndex {
            let newIndex = sIndex + eIndex - i
            result[newIndex] = v
        } else {
            
        }
    }
    return result
}

let caseCount = Int(readLine()!)!
for _case in 1...caseCount {
    
    let line1 = readLine()!
    let line2 = readLine()!
//    print("line1 \(line1)")
//    print("line2 \(line2)")
    var nums = getIntegersOf(line: line2, separatedBy: " ")
    
    
    var total = 0
    for _i in 0..<(nums.count - 1) {
        let i = _i + 1
        var minNum = 100000
        var minIndex = _i
        for index in _i..<nums.count {
            if minNum > nums[index] {
                minNum = nums[index]
                minIndex = index
            }
        }
        let j = minIndex + 1
        nums = reverse(inputs: nums, _i, minIndex)
//        print("DEV i:\(i) j:\(j)")
        let cost = j - i + 1
        total += cost
    }
    print("Case #\(_case): \(total)")
}


