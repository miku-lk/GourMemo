//
//  FavoriteTableViewCell.swift
//  GourMemo
//
//  Created by Miku Shimizu on 2017/03/01.
//  Copyright © 2017年 Miku Shimizu. All rights reserved.
//

import UIKit
import RealmSwift

class FavoriteTableViewCell: UITableViewCell {
    
    @IBOutlet var urlLabel: UILabel!
    @IBOutlet var toLineButton: UIButton!
    
    var realmIndexPath: Int!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    @IBAction func sendToLine(){
//        let realm = try! Realm()
//        sendMessage(realm.objects(FavoriteRestaurant.self)[indexPath.row].url)
//        NSLog("LINE!")
//    }
//    
//    // LINE
//    func sendMessage(_ text: String)  {
//        
//        let lineSchemeMessage: String! = "line://msg/text/"
//        var scheme: String! = lineSchemeMessage + text
//        
//        scheme = scheme.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//        let messageURL: URL! = URL(string: scheme)
//        
//        self.openURL(messageURL)
//    }
//    
//    func openURL(_ url: URL) {
//        if UIApplication.shared.canOpenURL(url) {
//            UIApplication.shared.open(url, options: [:], completionHandler: nil)
//        } else {
//            // 本来であれば、指定したURLで開けないときの実装を別途行う必要がある
//            print("failed to open..")
//        }
//    }


}
