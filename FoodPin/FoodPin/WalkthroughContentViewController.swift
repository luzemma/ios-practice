//
//  WalkthroughContentViewController.swift
//  FoodPin
//
//  Created by Luzemma Gonzalez on 14/03/16.
//  Copyright © 2016 Inspiring Learning. All rights reserved.
//

import UIKit

class WalkthroughContentViewController: UIViewController {
    
    @IBOutlet var headingLabel:UILabel!
    @IBOutlet var contentLabel:UILabel!
    @IBOutlet var contentImageView:UIImageView!
    @IBOutlet var pageControl:UIPageControl!
    @IBOutlet var forwardButton:UIButton!
    
    var index = 0
    var heading = ""
    var imageFile = ""
    var content = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headingLabel.text = heading
        contentLabel.text = content
        contentImageView.image = UIImage(named: imageFile)
        pageControl.currentPage = index
        
        switch index{
        case 0...1:forwardButton.setTitle("NEXT", forState: .Normal)
        case 2: forwardButton.setTitle("DONE", forState: .Normal)
        default: break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonTapped(sender:UIButton){
        switch index{
        case 0...1:
            let pageViewController = parentViewController as! WalkthroughPageViewController
            pageViewController.forward(index)
            
        case 2:
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setBool(true, forKey: "hasViewedWalkthrough")
            dismissViewControllerAnimated(true, completion: nil)
        default:break
        }
    }

}
