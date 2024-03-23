//
//  GeneralViewController.swift
//  GlobalEpidemic
//
//  Created by Андрей Петров on 21.03.2024.
//

import UIKit

class ConfigViewController: UIViewController {
    var configView: ConfigView {return self.view as! ConfigView}

    override func viewDidLoad() {
        super.viewDidLoad()

        configView.onActionButton = {[weak self] in self?.actionButton()}
        configView.thirdTextField.delegate = self
    }
    
    override func loadView() {
        self.view = ConfigView(frame: UIScreen.main.bounds)
    }
    
}

//MARK: - text field handler
extension ConfigViewController {
    @objc func actionButton() {
        let nextController = GeneralViewController()
        
        if let numberStringFirst = configView.firstTextField.text, let numberFirst = Int(numberStringFirst), 
            numberFirst < 2001 {
            nextController.groupSize = numberFirst
            
            guard let numberStringSecond = configView.secondTextField.text, let numberSecond = Int(numberStringSecond) else {
                presentSecondAlert()
                return
            }
            nextController.infectionFactor = numberSecond
            
            guard let numberStringThird = configView.thirdTextField.text, let numberThird = Int(numberStringThird) else {
                presentSecondAlert()
                return
            }
            nextController.recalculation = numberThird
        } else {
            presentFirstAlert()
        }
        
        navigationController?.pushViewController(nextController, animated: true)
    }

}

//MARK: - alert action
extension ConfigViewController {
    func presentFirstAlert() {
        present(configView.alert, animated: true, completion: nil)
    }
    
    func presentSecondAlert() {
        present(configView.alertSecond, animated: true, completion: nil)
    }
}

//MARK: - text field delegate
extension ConfigViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
