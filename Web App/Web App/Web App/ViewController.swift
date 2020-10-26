//
//  ViewController.swift
//  Web App
//
//  Created by user181417 on 10/20/20.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate {

    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var forwardButton: UIButton!
    
    
    @IBOutlet weak var bookmarksButton: UIButton!
    
    @IBOutlet weak var urlTextfield: UITextField!
    
    @IBOutlet weak var webView: WKWebView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate
    }
    override func viewDidAppear(_ animated: Bool) {
        webView.load(URLRequest(url: URL(string:"https://www.apple.com")!))
    }

    @IBAction func goBackTapped(_ sender: Any) {
        if (webView.canGoBack){
            webView.goBack()}
    }
    
    @IBAction func goForwardTapped(_ sender: Any) {
        if (webView.canGoForward){
            webView.goForward()
        }
    }
    
    @IBAction func openBookmarksTapped(_ sender: Any) {
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let urlString = urlTextfield.text
        let url = URL(string: urlString!)
        let urlRequest = URLRequest(url: url!)
        webView.load(urlRequest)
        
        textField.resignFirstResponder()
        
        return true
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButton.isEnabled = webView.canGoBack
        forwardButton.isEnabled = webView.canGoForward
        urlTextfield.text = webView.url?.absoluteString
    }
    
}

