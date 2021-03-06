//
//  InstructionViewController.swift
//  RingOfFire
//
//  Created by Michał Ciesielski on 24.12.2014.
//  Copyright (c) 2014 Michał Ciesielski. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController
{
 
    @IBOutlet weak var cardTitle: UILabel!
    @IBOutlet weak var cardView: UIImageView!
    @IBOutlet weak var cardInstructions: UITextView!
   
    @IBAction func throwCardAway(sender: UISwipeGestureRecognizer)
    {
        if (game.deck.count == 1)
        {
            performSegueWithIdentifier("instructionToEnd", sender: self)
        }
        else
        {
            performSegueWithIdentifier("instructionToSwipe", sender: self)
        }
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        self.hint()
        var timer = NSTimer()
        timer = NSTimer.scheduledTimerWithTimeInterval(3, target:self, selector:("hint"), userInfo: nil, repeats: true)
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        cardView.image = UIImage(named: activeCard.slug)
        cardInstructions.text = activeCard.instructions
        
        if activeCard.slug == "king"
        {
            cardTitle.text = " \(activeCard.title!) #\(game.kingCounter)"
            if game.kingCounter == 4
            {
                cardInstructions.text = NSLocalizedString("Oops.. You know what to do. Don't forget about your mates.", comment: "4th king")
            }
        }
        else
        {
            cardTitle.text = activeCard.title
        }
        
        cardInstructions.textAlignment = .Center
        cardInstructions.font = UIFont (name: "American Typewriter", size: 14.0)
    }
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var gravityDirection: CGVector!
    
    func hint()
    {
        let swipeHintStatic = UIImageView(frame: CGRect(x: self.view.frame.width/2-150 , y: self.view.frame.height-120, width: 300, height: 110))
        swipeHintStatic.image = UIImage(named: "swipe")
        view.addSubview(swipeHintStatic)
        
        let swipeHint = UIImageView(frame: CGRect(x: self.view.frame.width/2-150 , y: self.view.frame.height-120, width: 300, height: 110))
        swipeHint.image = UIImage(named: "swipe")
        view.addSubview(swipeHint)
        
        UIView.animateWithDuration(0.9, delay: 0, options: nil , animations: {swipeHint.alpha = 0}, completion: nil)
        
        animator = UIDynamicAnimator(referenceView: view)
        
        gravity = UIGravityBehavior(items: [swipeHint])
        gravity.gravityDirection = CGVectorMake(0.0, -1.0)
        animator.addBehavior(gravity)
    }
        
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}
