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
import URLEmbeddedView

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
    
    // 表示するたびにリロードする
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favoritesTableView.reloadData()
    }
    
    // セルを生成する時の処理
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTableViewCell") as! FavoriteTableViewCell
        let data = self.realm.objects(FavoriteRestaurant.self)[indexPath.row]
        cell.urlLabel.text = data.url
        cell.toLineButton.addTarget(self, action: #selector(self.openLine(button:)) , for: .touchUpInside)
        
        cell.embededView.loadURL(data.url)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            let data = self.realm.objects(FavoriteRestaurant.self)[indexPath.row]
            try! realm.write {
                realm.delete(data)
            }
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    // LINE
    func openLine(button: UIButton!){
        let cell = button.superview?.superview as! FavoriteTableViewCell
        let message = cell.urlLabel.text
        sendMessage(message!)
    }
    
    func sendMessage(_ text: String)  {
        
        let lineSchemeMessage: String! = "line://msg/text/"
        var scheme: String! = lineSchemeMessage + text
        
        scheme = scheme.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let messageURL: URL! = URL(string: scheme)
        
        self.openURL(messageURL)
    }
    
    func openURL(_ url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            // 本来であれば、指定したURLで開けないときの実装を別途行う必要がある
            print("failed to open..")
        }
    }
    
    // セルをタップしてブラウザを開く
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
