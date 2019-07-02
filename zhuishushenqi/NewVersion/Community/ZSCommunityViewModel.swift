//
//  ZSCommunityViewModel.swift
//  zhuishushenqi
//
//  Created by caony on 2019/7/2.
//  Copyright © 2019 QS. All rights reserved.
//

import UIKit
import ZSAPI

class ZSCommunityViewModel {
    var viewDidLoad: ()->() = {}
    var reloadBlock: ()->() = {}
    
    var twitters:[QSHotModel] = []
    
    init() {
        viewDidLoad = { [weak self] in
            self?.requestCommunity(completion: { [weak self] in
                self?.reloadBlock()
            })
        }
    }
    
    func requestCommunity() {
        requestCommunity { [weak self] in
            self?.reloadBlock()
        }
    }
    
    func requestCommunity(completion:@escaping()->Void) {
        let api = ZSAPI.userTwitter("" as AnyObject)
        zs_get(api.path) { [weak self] (json) in
            guard let tweets = json?["tweets"] as? [Any] else {
                completion()
                return
            }
            if let twitters = [QSHotModel].deserialize(from: tweets) as? [QSHotModel] {
                self?.twitters = twitters
                completion()
            } else {
                completion()
            }
        }
    }
}
