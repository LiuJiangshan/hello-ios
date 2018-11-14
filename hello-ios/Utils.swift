//
//  Utils.swift
//  hello-ios
//
//  Created by yfn on 2018/11/14.
//  Copyright © 2018年 ljs. All rights reserved.
//

import Foundation

class Logger {

    var debug = true

    var tag = ""

    init(_ tag: String) {
        self.tag = tag
    }

    init(_ tag: String, _ debug: Bool) {
        self.tag = tag
        self.debug = debug
    }

    func d(_ msg: Any) {
        if debug {
            print("\(tag):\(msg)")
        }
    }
}
