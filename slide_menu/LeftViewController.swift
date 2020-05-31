

import UIKit

enum LeftMenu: Int {
    case main = 0
    case swift
    case java
    case dart
    case web
}

import UIKit

class LeftViewController: UIViewController {
    
    @IBOutlet weak var myLeftTable: UITableView!
    var menus = ["Home", "Swift", "Java", "Dart", "Web View"]
    var mainViewController: UIViewController!
    var swiftViewController: UIViewController!
    var javaViewController: UIViewController!
    var dartViewController: UIViewController!
    var webViewController: UIViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        headerView.backgroundColor = UIColor.systemBlue
        
        myLeftTable.tableHeaderView = headerView
        myLeftTable.tableFooterView = UIView()
        myLeftTable.backgroundColor = .systemBlue
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.mainViewController = UINavigationController(rootViewController: mainViewController)
        
        let swiftViewController = storyboard.instantiateViewController(withIdentifier: "SwiftViewController") as! SwiftViewController
        self.swiftViewController = UINavigationController(rootViewController: swiftViewController)
        
        let javaViewController = storyboard.instantiateViewController(withIdentifier: "JavaViewController") as! JavaViewController
        self.javaViewController = UINavigationController(rootViewController: javaViewController)
        
        let dartViewController = storyboard.instantiateViewController(withIdentifier: "DartViewController") as! DartViewController
        self.dartViewController = UINavigationController(rootViewController: dartViewController)
        
        self.webViewController = UINavigationController(rootViewController: WebViewController())
    }
    
    
    func changeViewController(_ menu: LeftMenu) {
        switch menu {
        case .main:
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        case .swift:
            self.slideMenuController()?.changeMainViewController(self.swiftViewController, close: true)
        case .java:
            self.slideMenuController()?.changeMainViewController(self.javaViewController, close: true)
        case .dart:
            self.slideMenuController()?.changeMainViewController(self.dartViewController, close: true)
        case .web:
            self.slideMenuController()?.changeMainViewController(self.webViewController, close: true)
        }
    }


}

extension LeftViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menu = LeftMenu(rawValue: indexPath.row) {
            self.changeViewController(menu)
        }
    }

}


extension LeftViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        
        cell.textLabel?.text = menus[indexPath.row]
        
        return cell
    }
    
    
}
