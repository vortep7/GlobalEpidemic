//
//  InfoViewController.swift
//  GlobalEpidemic
//
//  Created by Андрей Петров on 21.03.2024.
//

import UIKit

class InfoViewController: UIViewController {
    private var infoView: InfoView {return self.view as! InfoView}

    override func loadView() {
        self.view = InfoView(frame: UIScreen.main.bounds)
    }
}
