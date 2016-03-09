//
//  Restaurant.swift
//  FoodPin
//
//  Created by Luzemma Gonzalez on 25/09/15.
//  Copyright © 2015 Inspiring Learning. All rights reserved.
//

import Foundation

class Restaurant {
    var name = ""
    var type = ""
    var location = ""
    var image = ""
    var phone = ""
    var isVisited = false
    
    
    init(name:String, type:String, location:String, phoneNumber:String, image:String, isVisited:Bool){
        self.name = name
        self.type = type
        self.location = location
        self.phone = phoneNumber
        self.image = image
        self.isVisited = isVisited
    }
}