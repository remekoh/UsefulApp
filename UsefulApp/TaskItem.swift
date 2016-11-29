//
//  TaskItem.swift
//  UsefulApp
//
//  Created by rem{e}koh on 11/13/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

import UIKit

class TaskItem: NSObject {
    
    var text = ""
    var checked = false
    
    func  toggleCheckmark() {
        checked = !checked
    }

}
