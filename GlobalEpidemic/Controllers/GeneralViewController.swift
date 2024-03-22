//
//  GeneralViewController.swift
//  GlobalEpidemic
//
//  Created by Андрей Петров on 21.03.2024.
//

import UIKit

class GeneralViewController: UIViewController {
    var groupSize:Int?
    var infectionFactor:Int?
    var Recalculation:Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        print(groupSize!)
        print(infectionFactor!)
        print(Recalculation!)
    }
    
    override func loadView() {
        self.view = GeneralView(frame: UIScreen.main.bounds)
    }

}
