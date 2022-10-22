//
//  main.swift
//  lab_03_commandTool
//
//  Created by poliorang on 20.10.2022.
//

import Foundation

let n = getSizeArray()

print("\nСгенерировать массив? y/n")
var answer = readLine()

var arr: [Double] = []
if answer == "y" {
    print("\nDouble / Int? d/i")
    answer = readLine()
    if answer == "i" {
        let arrInt = generateArrayInt(n: n)
        arr = arrInt.map{ Double($0) }
    } else {
        arr = generateArrayDouble(n: n)
    }
    print(arr)
} else if answer == "n" {
    arr = getArray(n: n)
}

//print(binarySearchTreeSort(arr))

print("\nСортировка блочная")
//    print(bucketSort(arr))
time = benchmark(bucketSort, arr)
print("Время |", time)

print("\nСортировка перемешиванием")
//    print(shakerSort(arr))
time = benchmark(shakerSort, arr)
print("Время |", time)

print("\nСортировка бинарным деревом")
//    print(binarySearchTreeSort(arr))
var time = benchmark(binarySearchTreeSort, arr)
print("Время |", time)
