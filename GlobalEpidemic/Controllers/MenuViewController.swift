import UIKit
import Lottie

class MenuViewController: UIViewController {
    
    var menuView: MenuView {return self.view as! MenuView}

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
        menuView.onInfoButtonAction = {[weak self] in menuView.}
    }
    
    override func loadView() {
        self.view = MenuView(frame: UIScreen.main.bounds)
    }

}

extension MenuViewController {
    @objc func
}
