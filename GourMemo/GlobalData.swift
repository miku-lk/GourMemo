//
//  GlobalData.swift
//  GourMemo
//
//  Created by Miku Shimizu on 2017/03/03.
//  Copyright © 2017年 Miku Shimizu. All rights reserved.
//

import UIKit
import RealmSwift


class FavoriteRestaurant: Object{
    dynamic var url = ""
}

let statusbarHeight = UIApplication.shared.statusBarFrame.size.height

let navigationController: UINavigationController = UINavigationController()
let navigationbarHeight = navigationController.navigationBar.frame.size.height

let toolbarHeight = navigationController.toolbar.frame.size.height
