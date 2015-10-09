//
//  ViewController.swift
//  testTable
//
//  Created by Luzemma Gonzalez on 01/10/15.
//  Copyright © 2015 Inspiring Learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var branchTable: UITableView!
    @IBOutlet weak var branchView: UIView!
    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        self.branchTable.frame.origin.y = 150.0
        
        
    }
    


}

