//
//  GlobalImpactViewController.swift
//  AlanBurr CSP
//
//  Created by Burr, Alan on 11/8/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit

public class GlobalImpactViewController
{
    @IBOutlet weak var Image1: UIImageView!
    @IBOutlet weak var Image2: UIImageView!
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label3: UILabel!
    
    public func viewDidLoad()
    {
        let LabelA :String = "The Problem is that some places in the world they don't have clean or sanitary water. As a result they have higher mortality rates for infants who die by disases in the water."
        
        let LabelB :String = "I have a personal connection to this because I don't want to get sick by drinking random water. I would be alot safer if I didn't have to worry if the water I drink is contaminated or not."
        
        Label2.text = LabelA
        
        Label3.text = LabelB
        
        Image1.image = #imageLiteral(resourceName: "Screen Shot 2017-11-14 at 12.02.55 PM")
        
        Image2.image = #imageLiteral(resourceName: "HappyChild")
    }
}
