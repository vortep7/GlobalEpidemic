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
    }
    
    override func loadView() {
        self.view = ConfigView(frame: UIScreen.main.bounds)
    }
    
}

//MARK: - text field handler
extension ConfigViewController {
    @objc func actionButton() {
        let nextController = GeneralViewController()
        
        if let numberStringFirst = configView.firstTextField.text, let numberFirst = Int(numberStringFirst) {
            if numberFirst < 201 {
                nextController.groupSize = numberFirst
                
                if let numberStringSecond = configView.secondTextField.text, let numberSecond = Int(numberStringSecond) {
                    nextController.infectionFactor = numberSecond
                    
                    if let numberStringThird = configView.thirdTextField.text, let numberThird = Int(numberStringThird) {
                        nextController.Recalculation = numberThird
                    } else {
                        presentSecondAlert()
                    }
                } else {
                    presentSecondAlert()
                }
                
            } else {
                presentFirstAlert()
            }
        } else {
            presentSecondAlert()
        }
        
        navigationController?.pushViewController(nextController, animated: true)
    }

}

extension ConfigViewController {
    func presentFirstAlert() {
        present(configView.alert, animated: true, completion: nil)
    }
    
    func presentSecondAlert() {
        present(configView.alertSecond, animated: true, completion: nil)
    }
}
