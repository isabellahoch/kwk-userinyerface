//
//  TermsAndConditionsViewController.swift
//  UserInyerface
//
//  Created by Scholar on 7/28/22.
//

import UIKit
import WebKit

class TermsAndConditionsViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://www.kodewithklossy.com/tos")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = false
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
