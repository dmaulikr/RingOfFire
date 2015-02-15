//
//  CardViewController.swift
//  RingOfFire
//
//  Created by Michał Ciesielski on 24.12.2014.
//  Copyright (c) 2014 Michał Ciesielski. All rights reserved.
//

import UIKit

class CardViewController: UIViewController
{
    @IBOutlet weak var cardView: UIImageView!
    
    @IBAction func throwCardAway(sender: UISwipeGestureRecognizer)
    {
        performSegueWithIdentifier("cardToSwipe", sender: self)
        println("wywalam karte")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        var activeCard = game.deck[0]
        
        cardView.image = UIImage(named: activeCard.slug)
     
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}