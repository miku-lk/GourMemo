//
//  BrowserViewController.swift
//  GourMemo
//
//  Created by Miku Shimizu on 2017/03/03.
//  Copyright © 2017年 Miku Shimizu. All rights reserved.
//

import UIKit
import WebKit

class BrowserViewController: UIViewController {
    
    var webView: WKWebView!
    
    var requestedUrl: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // WKWebViewを生成
        let y = statusbarHeight + navigationbarHeight
        webView = WKWebView(frame:CGRect(x: 0, y: y, width: self.view.bounds.size.width, height: self.view.bounds.size.height - y - toolbarHeight))
        
        // フリップで進む・戻るを許可
        webView.allowsBackForwardNavigationGestures = true
        
        // 表示
        let urlString = requestedUrl
        let url = NSURL(string: urlString)
        let request = NSURLRequest(url: url! as URL)
        webView.load(request as URLRequest)
        
        // Viewに貼り付け
        self.view.addSubview(webView)
        
    }
    
    @IBAction func back() {
        NSLog("back")
        self.webView.goBack()
    }
    
    @IBAction func forward() {
        NSLog("forward")
        self.webView.goForward()
    }
    
    @IBAction func like() {
        NSLog("like")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
