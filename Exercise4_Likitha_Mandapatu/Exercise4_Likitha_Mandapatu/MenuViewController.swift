//
//  MenuViewController.swift
//  Exercise4_Likitha_Mandapatu
//
//  Created by Likitha Mandapati on 9/17/22.
//

import UIKit

class MenuViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var messageViewTopPortraitConstraint: NSLayoutConstraint!
    @IBOutlet weak var messageViewTopLandscapeConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var hodTitleTrailingPortraitConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var fightActionView: UIView!
    @IBOutlet weak var restartActionView: UIView!
    
    @IBOutlet weak var titleImageView: UIImageView!
    
    @IBOutlet weak var player1Image: UIImageView!
    @IBOutlet weak var player2Image: UIImageView!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    var playerOneScore : Int = 0
    var playerTwoScore : Int = 0
    
    var scoreVC: ScoreViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetGame()
        setRestartTapGesture()
        setFightTapGesture()
        
        scoreVC = self.tabBarController!.viewControllers![1] as? ScoreViewController
        // Do any additional setup after loading the view.
        self.titleImageView.image = UIImage(named: "0_HOD_text.png")
    }
    
    func resetGame() {
        playerOneScore = 0
        playerTwoScore = 0
        scoreVC?.Player1Score = 0
        scoreVC?.Player2Score = 0
        player1Image.image = UIImage(named: "0_HOD_logo.png")
        player2Image.image = UIImage(named: "0_HOD_logo.png")
        messageLabel.text = "Prepare for the battle!"
    }
    
    func setRestartTapGesture() {
        let restartTap = UITapGestureRecognizer(target: self, action: #selector(self.restartGame(_:)))
        restartTap.delegate = self
        self.restartActionView.addGestureRecognizer(restartTap)
    }
    
    func setFightTapGesture() {
        let fightTap = UITapGestureRecognizer(target: self, action: #selector(self.fight(_:)))
        fightTap.delegate = self
        self.fightActionView.addGestureRecognizer(fightTap)
    }
    
    @objc func restartGame(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        resetGame()
        setFightTapGesture()
    }
    
    @objc func fight(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        let namesOfDragons = ["Balerion", "Meraxes", "Sheepstealer", "Meleys", "Quicksilver", "Silverwing", "Drogon", "Stormcloud", "Viserion"]
        
        let dragon1Index = Int.random(in: 0...8)
        let dragon2Index = Int.random(in: 0...8)
        
        let dragon1 = namesOfDragons[dragon1Index]
        let dragon2 = namesOfDragons[dragon2Index]
        
        self.player1Image.image = UIImage(named: dragon1)
        self.player2Image.image = UIImage(named: dragon2)
        
        if(dragon1Index < dragon2Index)
        {
            self.playerOneScore += 1
            scoreVC?.Player1Score = playerOneScore
            if self.playerOneScore >= 3
            {
                self.messageLabel.text = "Player 1 won! (\(playerOneScore) - \(playerTwoScore)). \n Restart the game."
                self.fightActionView.gestureRecognizers?.removeAll()
            } else
            {
                self.messageLabel.text = "\(dragon1) is stronger. \n Player 1 wins the round!"
            }
        } else if(dragon1Index > dragon2Index) {
            self.playerTwoScore += 1
            scoreVC?.Player2Score = playerTwoScore
            if self.playerTwoScore >= 3
            {
                self.messageLabel.text = "Player 2 won! (\(playerOneScore) - \(playerTwoScore)). \n Restart the game."
                self.fightActionView.gestureRecognizers?.removeAll()
            } else
            {
                self.messageLabel.text = "\(dragon2) is stronger. \n Player 2 wins the round!"
            }
        } else {
            self.messageLabel.text = "It's a tie"
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate { _ in
            if UIDevice.current.orientation.isLandscape {
                self.applyLandScapeConstraint()
            } else {
                self.applyPortraitConstraint()
            }
        }
    }
    
    @IBAction func restartAction(_ sender: Any) {
        
    }
    
    func applyPortraitConstraint(){
        self.messageViewTopPortraitConstraint.isActive = true
        self.messageViewTopLandscapeConstraint.isActive = false
        self.hodTitleTrailingPortraitConstraint.isActive = true
    }
    
    func applyLandScapeConstraint(){
        self.messageViewTopPortraitConstraint.isActive = false
        self.messageViewTopLandscapeConstraint.isActive = true
        self.hodTitleTrailingPortraitConstraint.isActive = false
    }
}

