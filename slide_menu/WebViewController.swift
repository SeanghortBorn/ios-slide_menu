

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    
    @IBOutlet weak var contentView: UIView!
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Web View"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .systemBlue
        setNavigationBarItem()

//        setupUI()
        
        let url = URL(string: "https://apple.com")!
        webView.load(URLRequest(url: url))
        
        
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }


}

//extension WebViewController {
//
//    func setupUI() {
//        self.contentView.addSubview(webView)
//
//        NSLayoutConstraint.activate([
//            webView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
//            webView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
//            webView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
//            webView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
//
//        ])
//    }
//}
