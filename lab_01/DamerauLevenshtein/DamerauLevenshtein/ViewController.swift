//
//  ViewController.swift
//  DamerauLevenshtein
//
//  Created by poliorang on 22.09.2022.
//

import UIKit
import Foundation

private let methodsArray = ["resursive", "with matrix", "resursive with cash", "all"]
public var firstWord = "кот"
public var secondWord = "скат"
public var function = ["Recursive", "Matrix", "Recursive with cash"]
public var currentFunction = 0
public var spinnerView : UIView?

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var methodLabel: UILabel!
    
    @IBOutlet weak var firstWordField: UITextField!
    @IBOutlet weak var secondWordField: UITextField!

    @IBOutlet weak var button: UIButton!
    @IBAction func firstFieldAction(_ sender: Any) {
        firstWord = firstWordField.text ?? "кот"
    }
    @IBAction func secondFieldAction(_ sender: Any) {
        secondWord = secondWordField.text ?? "скат"
    }
    
    @IBOutlet weak var methorPicker: UIPickerView!
    @IBAction func calculateButton(_ sender: Any) {
        removeSpinner()
    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.addTarget(self, action: #selector(showSpinner), for: UIControl.Event.touchDown)
        
        methorPicker.dataSource = self
        methorPicker.delegate = self
        
        setupPlaceholders()
        setupDismissKeyboard()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setupPlaceholders() {
        firstWordField.attributedPlaceholder = NSAttributedString(
            string: "кот",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        
        secondWordField.attributedPlaceholder = NSAttributedString(
            string: "cкaт",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
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
//        activityIndicator.style.
        activityIndicator.center = spinnerView!.center
        activityIndicator.startAnimating()
        spinnerView?.addSubview(activityIndicator)
        self.view.addSubview(spinnerView!)
    }
    
    func removeSpinner() {
        spinnerView?.removeFromSuperview()
        spinnerView = nil
    }
}


extension ViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        4
    }
    
}


extension ViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return methodsArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: String(methodsArray[row]), attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentFunction = row
    }
}
