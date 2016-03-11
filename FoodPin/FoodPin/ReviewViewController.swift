//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Luzemma Gonzalez on 10/03/16.
//  Copyright © 2016 Inspiring Learning. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet var backgroundImageView:UIImageView!
    @IBOutlet var dislikeButton:UIButton!
    @IBOutlet var goodButton:UIButton!
    @IBOutlet var greatButton:UIButton!
    
    
    var rating:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: .Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        let scale = CGAffineTransformMakeScale(0.0, 0.0)
        let translate = CGAffineTransformMakeTranslation(0.0, 500.0)
        
        
        self.dislikeButton.transform = CGAffineTransformConcat(scale, translate)
        self.goodButton.transform = CGAffineTransformConcat(scale, translate)
        self.greatButton.transform = CGAffineTransformConcat(scale, translate)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.4, delay: 0.0, options: [], animations: { () -> Void in
            self.dislikeButton.transform = CGAffineTransformIdentity
            }, completion: nil)
        
        UIView.animateWithDuration(0.6, delay: 0.0, options: [], animations: { () -> Void in
            self.goodButton.transform = CGAffineTransformIdentity
            }, completion: nil)
        UIView.animateWithDuration(0.8, delay: 0.0, options: [], animations: { () -> Void in
            self.greatButton.transform = CGAffineTransformIdentity
            }, completion: nil)
    }
    
    @IBAction func ratingSelected(sender:UIButton){
        switch (sender.tag){
        case 100: rating = "dislike"
        case 200: rating = "good"
        case 300: rating = "great"
        default: break
        }
        
        performSegueWithIdentifier("unwindToDetailView", sender: sender)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
