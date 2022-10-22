//
//  functions.swift
//  lab_03_commandTool
//
//  Created by poliorang on 20.10.2022.
//

import Foundation

enum BinaryTree<T: Comparable> {
    case empty
    indirect case node(BinaryTree, T, BinaryTree)
    
    func newTreeWithInsertedValue(newValue: T) -> BinaryTree {
        switch self {
        case .empty:
            return .node(.empty, newValue, .empty)
        case let .node(left, value, right):
            if newValue < value {
                return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
            } else {
                return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
            }
        }
    }
    
    mutating func insert(newValue: T) {
        self = newTreeWithInsertedValue(newValue: newValue)
    }
    
    func traverseInOrder(process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
}

func binarySearchTreeSort<T: Comparable>(_ array: [T]) -> [T] {
    var resultArray: [T] = []
    var tree: BinaryTree<T> = .empty
    
    for elem in array { tree.insert(newValue: elem) }
    tree.traverseInOrder(process: { resultArray.append($0) })
    
    return resultArray
}
