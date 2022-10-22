import Foundation

var matrix = generateMatrix(20, 20)
printMatrix(n: 20, m: 20, matrix: matrix)

func generateMatrix(_ n: Int, _ m: Int) -> [[Int]] {
    var matrix = createMatrix(n: n, m: m, fill: 0)
    
    for i in 0..<n {
        for j in 0..<m {
            matrix[i][j] = Int.random(in: -1000...1000)
        }
    }
    
    return matrix
}

func createMatrix(n: Int, m: Int, fill: Int) -> Array<[Int]> {
    let matrix = [[Int]](repeating: [Int](repeating: fill, count: m), count: n)
    
    return matrix
}

func printMatrix(n: Int, m : Int, matrix: [[Int]]) {
    for i in 0..<n {
        for j in 0..<m {
            print(matrix[i][j], terminator: " ")
        }
        print("")
    }
}
