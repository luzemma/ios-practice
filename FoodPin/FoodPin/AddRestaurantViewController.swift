//
//  AddRestaurantViewController.swift
//  FoodPin
//
//  Created by Luzemma Gonzalez on 10/03/16.
//  Copyright © 2016 Inspiring Learning. All rights reserved.
//

import UIKit
import CoreData

class AddRestaurantViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var imageView:UIImageView!
    @IBOutlet var nameTextField:UITextField!
    @IBOutlet var typeTextField:UITextField!
    @IBOutlet var locationTextField:UITextField!
    @IBOutlet var phoneNumberTextField:UITextField!
    @IBOutlet var yesButton:UIButton!
    @IBOutlet var noButton:UIButton!
    
    var isVisited:Bool = true
    var restaurant:Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0{
            if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .PhotoLibrary
                
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        
        let leadingConstraint = NSLayoutConstraint(item: imageView, attribute: .Leading, relatedBy: .Equal, toItem: imageView.superview, attribute: .Leading, multiplier: 1, constant: 0)
        leadingConstraint.active = true
        
        let trailingConstraint = NSLayoutConstraint(item: imageView, attribute: .Trailing, relatedBy: .Equal, toItem: imageView.superview, attribute: .Trailing, multiplier: 1, constant: 0)
        trailingConstraint.active = true
        
        let topConstraint = NSLayoutConstraint(item: imageView, attribute: .Top, relatedBy: .Equal, toItem: imageView.superview, attribute: .Top, multiplier: 1, constant: 0)
        topConstraint.active = true
        
        let bottomConstraint = NSLayoutConstraint(item: imageView, attribute: .Bottom, relatedBy: .Equal, toItem: imageView.superview, attribute: .Bottom, multiplier: 1, constant: 0)
        bottomConstraint.active = true
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveRestaurant(sender: UIBarButtonItem) {
        let name = nameTextField.text
        let type = typeTextField.text
        let location = locationTextField.text
        let phoneNumber = phoneNumberTextField.text
        
        if name == "" && type == "" && location == "" && phoneNumber == ""{
            let alertController = UIAlertController(title: "Opss", message: "We can't proceed because one of the fields is blank. Please note that all fields are required", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            return
        }
        
        print("Name: \(name)")
        print("Type: \(type)")
        print("Location: \(location)")
        print("Phone Number: \(phoneNumber)")
        print("Have you been here: \(isVisited)")
        
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext{
            restaurant = NSEntityDescription.insertNewObjectForEntityForName("Restaurant", inManagedObjectContext: managedObjectContext) as! Restaurant
            restaurant.name = name!
            restaurant.type = type!
            restaurant.location = location!
            restaurant.phoneNumber = phoneNumber!
            
            if let restaurantImage = imageView.image{
                restaurant.image = UIImagePNGRepresentation(restaurantImage)
            }
            restaurant.isVisited = isVisited
            
            do{
                try managedObjectContext.save()
            }catch {
                print(error)
                return
            }
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func toggleBeenHereButton(sender:UIButton){
        if sender == yesButton{
            self.isVisited = true
            yesButton.backgroundColor = UIColor.redColor()
            noButton.backgroundColor = UIColor.lightGrayColor()
        }else if sender == noButton{
            self.isVisited = false
            yesButton.backgroundColor = UIColor.lightGrayColor()
            noButton.backgroundColor = UIColor.redColor()
        }
    }
    


}
