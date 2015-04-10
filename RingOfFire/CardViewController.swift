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
    @IBOutlet weak var imageToSuperTrailing: NSLayoutConstraint!
    
    @IBOutlet weak var imageToSuperTop: NSLayoutConstraint!

    @IBOutlet weak var imageToSuperLeading: NSLayoutConstraint!
    
    @IBOutlet weak var imageToSuperBottom: NSLayoutConstraint!
    
    @IBAction func throwCardAway(sender: UISwipeGestureRecognizer)
    {
        if (game.deck.count == 1)
        {
            performSegueWithIdentifier("cardToEnd", sender: self)
        }
        else
        {
            performSegueWithIdentifier("cardToSwipe", sender: self)
        }
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
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.cardView.alpha = 1;
           
        })
        
        self.imageToSuperBottom.constant = -100
        self.imageToSuperTop.constant = -100
        
        UIView.animateWithDuration(1, delay: 0.4, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: nil, animations: { () -> Void in
            
            self.view.layoutIfNeeded()

        }, completion: nil)
        
    }
}