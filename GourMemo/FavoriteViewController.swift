//
//  FavoriteViewController.swift
//  GourMemo
//
//  Created by Miku Shimizu on 2017/03/01.
//  Copyright © 2017年 Miku Shimizu. All rights reserved.
//

import UIKit
import RealmSwift
import SafariServices

class FavoriteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var favoritesTableView: UITableView!
    
    let realm = try! Realm()
    
    var sendToBrowser: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        
//        let url_1 = FavoriteRestaurant()
//        url_1.url = "https://google.co.jp"
//        let url_2 = FavoriteRestaurant()
//        url_2.url = "http://yahoo.co.jp"
//        let url_3 = FavoriteRestaurant()
//        url_3.url = "https://twitter.com/miku_lk_"
//        
//        try! realm.write {
//            realm.add(url_1)
//            realm.add(url_2)
//            realm.add(url_3)
//        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectedUrl: URL = URL(string: realm.objects(FavoriteRestaurant.self)[indexPath.row].url)!
//        let browser = SFSafariViewController(url: selectedUrl, entersReaderIfAvailable: true)
//        self.present(browser, animated: true, completion: nil)
        sendToBrowser = realm.objects(FavoriteRestaurant.self)[indexPath.row].url
        performSegue(withIdentifier: "toBrowser", sender: nil)
    }
    
    // 画面遷移時に値を遷移先に渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toBrowser") {
            // SecondViewControllerクラスをインスタンス化してsegue（画面遷移）で値を渡せるようにバンドルする
            let browserView :BrowserViewController = segue.destination as! BrowserViewController
            // secondView（バンドルされた変数）に受け取り用の変数を引数とし_paramを渡す（_paramには渡したい値）
            // この時SecondViewControllerにて受け取る同型の変数を用意しておかないとエラーになる
            browserView.requestedUrl = sendToBrowser
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTableViewCell") as! FavoriteTableViewCell
        let data = self.realm.objects(FavoriteRestaurant.self)[indexPath.row]
        cell.urlLabel.text = data.url
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realm.objects(FavoriteRestaurant.self).count
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
