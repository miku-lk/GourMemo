//
//  FavoriteTableViewCell.swift
//  GourMemo
//
//  Created by Miku Shimizu on 2017/03/01.
//  Copyright © 2017年 Miku Shimizu. All rights reserved.
//

import UIKit
import RealmSwift
import URLEmbeddedView

class FavoriteTableViewCell: UITableViewCell {
    
    @IBOutlet var urlLabel: UILabel!
    @IBOutlet var toLineButton: UIButton!
    @IBOutlet weak var embededView: URLEmbeddedView!
    
    var realmIndexPath: Int!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
