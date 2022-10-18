//
//  ViewController.swift
//  WinogradLab
//
//  Created by poliorang on 17.10.2022.
//

import UIKit

public var methodsArray = ["Стандартный",
                           "Винограда",
                           "Оптимизированный Винограда",
                           "Все методы"]
public var currentMethod = 0
public var firstMatrix : [[Int]] = []
public var secondMatrix : [[Int]] = []
public var resultMatrix : [[Int]] = []
public var nFirst = 0
public var mFirst = 0
public var nSecond = 0
public var mSecond = 0
public var spinnerView : UIView?
var placeholderLabel = UILabel()

class ViewController: UIViewController {
    private let alertManager = AlertManager.shared
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var firstMatrixField: UITextView!
    @IBOutlet weak var secondMatrixField: UITextView!

    @IBOutlet weak var xLabel: UILabel!

    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var methodPicker: UIPickerView!
    
    @IBAction func calculateAction(_ sender: Any) {
        if getMatrixs() == false {
            alertManager.showAlert(presentTo: self, title: "Ошибка", message: "Некорректный элемент матрицы")
        }
        
        if checkSizes(nFirst, mFirst, nSecond, mSecond) == false {
            alertManager.showAlert(presentTo: self, title: "Ошибка", message: "Некорректные размеры матрицы")
        }
        
        removeSpinner()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        methodPicker.dataSource = self
        methodPicker.delegate = self
        calculateButton.addTarget(self, action: #selector(showSpinner), for: UIControl.Event.touchDown)
        
        setupDismissKeyboard()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setupDismissKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc
    func showSpinner() {
        spinnerView = UIView(frame: self.view.bounds)
        spinnerView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = spinnerView!.center
        activityIndicator.startAnimating()
        spinnerView?.addSubview(activityIndicator)
        self.view.addSubview(spinnerView!)
    }
    
    func removeSpinner() {
        spinnerView?.removeFromSuperview()
        spinnerView = nil
    }
    
    
    func getMatrixs() -> Bool {
        initializeMatrix()
        
        let firstMatrixString = firstMatrixField.text ?? ""
        if parseMatrix(firstMatrixString, &nFirst, &mFirst, &firstMatrix) == false {
            print("Неверные размеры")
            
            return false
        }
        
        let secondMatrixString = secondMatrixField.text ?? ""
        if parseMatrix(secondMatrixString, &nSecond, &mSecond, &secondMatrix) == false {
            print("Неверные размеры")
            
            return false
        }
        
        return true
    }
}


extension ViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { 4 }
}


extension ViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return methodsArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: String(methodsArray[row]), attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentMethod = row
    }
}


protocol BasicAlertDescription {
    func showAlert(presentTo: UIViewController, title: String?, message: String?)
}

final class AlertManager: BasicAlertDescription {
    static let shared: BasicAlertDescription = AlertManager()
    
    private init() {}
    
    func showAlert(presentTo controller: UIViewController, title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(okAction)
        controller.present(alertController, animated: true, completion: nil)
    }
}
