//
//  GeneralViewController.swift
//  GlobalEpidemic
//
//  Created by Андрей Петров on 21.03.2024.
//

import UIKit

class GeneralViewController: UIViewController {
    var receivedText:Int?


    override func viewDidLoad() {
        super.viewDidLoad()

        print(receivedText!)
    }
    
    override func loadView() {
        self.view = GeneralView(frame: UIScreen.main.bounds)
    }

}
