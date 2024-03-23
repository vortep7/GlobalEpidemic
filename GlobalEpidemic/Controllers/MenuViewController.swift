import UIKit
import Lottie

class MenuViewController: UIViewController {
    
    var menuView: MenuView {return self.view as! MenuView}

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuView.onInfoButtonAction = {[weak self] in self?.pushInfoController()}
        menuView.onLogButtonAction = {[weak self] in self?.pushGeneralController()}
    }
    
    override func loadView() {
        self.view = MenuView(frame: UIScreen.main.bounds)
    }

}

extension MenuViewController {
    @objc func pushInfoController() {
        let nextController = InfoViewController()
        menuView.animationForInfoButton()
        navigationController?.pushViewController(nextController, animated: true)
    }
    
    @objc func pushGeneralController() {
        menuView.animationForLogButton()
        let nextController = ConfigViewController()
        navigationController?.pushViewController(nextController, animated: true)
    }
}
