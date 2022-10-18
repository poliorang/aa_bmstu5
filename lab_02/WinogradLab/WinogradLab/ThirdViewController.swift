//
//  ThirdViewController.swift
//  WinogradLab
//
//  Created by poliorang on 18.10.2022.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var matrixLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultMatrix = standardMultiplication(firstMatrix, secondMatrix)
        setupLabel()
    }
    
    
    func setupLabel() {
        print(matrixToString(n: nFirst, m: mSecond, matrix: resultMatrix))
        mainLabel.numberOfLines = nFirst + 1
        mainLabel.text = matrixToString(n: nFirst, m: mSecond, matrix: resultMatrix)
    }
}
