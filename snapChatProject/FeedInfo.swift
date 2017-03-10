//
//  FeedInfo.swift
//  snapChatProject
//
//  Created by Jimmy on 3/9/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class FeedInfo{
    var image: UIImage?
    var date:Date?
    var from:String?
    var read:Bool?
    var indicator:UIImage?
    
    init(image:UIImage, date:Date, from:String) {
        self.read = false
        self.image = image
        self.date  = date
        self.from = from
        
    }
}
