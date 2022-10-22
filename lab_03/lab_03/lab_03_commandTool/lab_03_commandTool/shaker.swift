//
//  functions.swift
//  lab_03_commandTool
//
//  Created by poliorang on 20.10.2022.
//

import Foundation

func shakerSort<T: Comparable>(_ array: [T]) -> [T] {
    var resultArray = array
    var left = 0
    var right = resultArray.count - 1

    while left <= right {
        for i in left..<right {
            if resultArray[i] > resultArray[i + 1] {
                resultArray.swapAt(i, i + 1)
            }
        }
        right -= 1

        for i in stride(from: right, to: left, by: -1) {
            if resultArray[i - 1] > resultArray[i] {
                resultArray.swapAt(i, i - 1)
            }
        }
        left += 1
    }
    
    return resultArray
}
