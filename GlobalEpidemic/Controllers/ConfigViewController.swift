//
//  GeneralViewController.swift
//  GlobalEpidemic
//
//  Created by Андрей Петров on 21.03.2024.
//

import UIKit

class ConfigViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        self.view = ConfigView(frame: UIScreen.main.bounds)
    }
    
}
