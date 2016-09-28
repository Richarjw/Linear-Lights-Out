//
//  ViewController.swift
//  LinearLightsOut
//
//  Created by Tracy Richard on 6/20/16.
//  Copyright © 2016 Jack Richard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gameStateLabel: UILabel!
    @IBOutlet weak var gameStateNavBar: UINavigationBar!
    
    @IBOutlet var gameButtons: [UIButton]!
    
    let on = UIImage(named: "light_on.png")
    let off = UIImage(named: "light_off.png")
    
    @IBOutlet weak var gameImageView: UIImageView!
    
    var game = LinearLightsOutGame(numLights: 13);

    
    @IBAction func pressedNewGame(sender: AnyObject) {
        game = LinearLightsOutGame(numLights: 13)
        gameStateLabel.text = "Turn Off All The Lights!"
        gameStateNavBar.topItem?.title = "Turn Off All The Lights!"
        updateView()
    
    }

    @IBAction func pressedGameButton(sender: AnyObject) {
        let button = sender as! UIButton
        game.pressedLightAtIndex(button.tag)
        updateView()
        
    }
    
    func updateView() {
        if (game.moves != 0) {
            if (game.getLightStates() == "0000000000000") {
                gameStateLabel.text = "You won in \(game.moves) moves."
                gameStateNavBar.topItem?.title = "You won in \(game.moves) moves."
            }
            else {
            gameStateLabel.text = "You have taken \(game.moves) moves."
            gameStateNavBar.topItem?.title = "You have taken \(game.moves) moves."
            }
        }

        for button in gameButtons {
            switch game.getCurrentLightState(button.tag){
            case true:
                button.setImage(on, forState: .Normal)
            case false:
                button.setImage(off, forState: .Normal)
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
                gameStateNavBar.titleTextAttributes = [NSFontAttributeName: UIFont.boldSystemFontOfSize(20)]
        // Do any additional setup after loading the view, typically from a nib.
        updateView()
    }


}

