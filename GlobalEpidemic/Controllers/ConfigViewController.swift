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

extension ConfigViewController {
    @objc func actionButton() {
        let nextController = GeneralViewController()

        if let number = Int(configView.firstTextField.text ?? "0") {
            if number < 201 {
                nextController.receivedText = number
            } else {
                present(configView.alert, animated: true, completion: nil)
            }
        }
        
        navigationController?.pushViewController(nextController, animated: true)
    }
}
