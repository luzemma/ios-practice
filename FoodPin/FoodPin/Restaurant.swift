//
//  Restaurant.swift
//  FoodPin
//
//  Created by Luzemma Gonzalez on 25/09/15.
//  Copyright © 2015 Inspiring Learning. All rights reserved.
//

import Foundation
import CoreData

class Restaurant:NSManagedObject {
    @NSManaged var name:String
    @NSManaged var type:String
    @NSManaged var location:String
    @NSManaged var phoneNumber:String?
    @NSManaged var image:NSData?
    @NSManaged var isVisited:NSNumber?
    @NSManaged var rating:String?
}