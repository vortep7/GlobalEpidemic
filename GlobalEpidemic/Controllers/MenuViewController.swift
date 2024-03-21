import UIKit
import Lottie

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
    }
    
    override func loadView() {
        self.view = MenuView(frame: UIScreen.main.bounds)
    }

}

