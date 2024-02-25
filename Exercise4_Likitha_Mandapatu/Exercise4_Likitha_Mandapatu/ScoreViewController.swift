//
//  ScoreViewController.swift
//  Exercise4_Likitha_Mandapatu
//
//  Created by Likitha Mandapati on 9/17/22.
//

import UIKit

class ScoreViewController: UIViewController {
    
    @IBOutlet weak var player2TopPortraitConstraint: NSLayoutConstraint!
    @IBOutlet weak var player2TopLandscapeConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var player1Score1: UIImageView!
    @IBOutlet weak var player1Score2: UIImageView!
    @IBOutlet weak var player1Score3: UIImageView!
    
    @IBOutlet weak var player2Score1: UIImageView!
    @IBOutlet weak var player2Score2: UIImageView!
    @IBOutlet weak var player2Score3: UIImageView!
    
    public var Player1Score = 0
    public var Player2Score = 0
    
    override func viewWillAppear(_ animated: Bool) {
        //check the player score and update images according to the score.
        
        
        switch Player1Score {
        case 0 :
            player1Score1.isHidden = true
            player1Score2.isHidden = true
            player1Score3.isHidden = true
        case 1:
            player1Score1.isHidden = false
            player1Score2.isHidden = true
            player1Score3.isHidden = true
        case 2:
            player1Score1.isHidden = false
            player1Score2.isHidden = false
            player1Score3.isHidden = true
        default:
            player1Score1.isHidden = false
            player1Score2.isHidden = false
            player1Score3.isHidden = false
        }
        
        switch Player2Score {
        case 0 :
            player2Score1.isHidden = true
            player2Score2.isHidden = true
            player2Score3.isHidden = true
        case 1:
            player2Score1.isHidden = false
            player2Score2.isHidden = true
            player2Score3.isHidden = true
        case 2:
            player2Score1.isHidden = false
            player2Score2.isHidden = false
            player2Score3.isHidden = true
        default:
            player2Score1.isHidden = false
            player2Score2.isHidden = false
            player2Score3.isHidden = false
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate { _ in
            if UIDevice.current.orientation.isLandscape {
                //self.applyLandScapeConstraint()
            } else {
                self.applyPortraitConstraint()
            }
        }
    }

    func applyPortraitConstraint(){
        self.player2TopPortraitConstraint.isActive = true
        self.player2TopLandscapeConstraint.isActive = false
        
    }
    
    /*func applyLandScapeConstraint(){
        self.player2TopPortraitConstraint.isActive = false
        self.player2TopLandscapeConstraint.isActive = true
    }*/
}
