//
//  ViewController.swift
//  99RedBallons
//
//  Created by Juice Rios on 1/21/15.
//  Copyright (c) 2015 HectorRios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var balloonLabel: UILabel!
    
    var ballons:[Ballon] = []
    
    var imageNames = ["RedBalloon1.jpg", "RedBalloon2.jpg", "RedBalloon3.jpg", "RedBalloon4.jpg"]
    
    var currentBalloonIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //populate the ballons array
        self.create99Ballons()
        
        
        println("The number of ballons is: \(ballons.count)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextBarButtonItemClicked(sender: UIBarButtonItem) {
        //Move to the next ballon object
        
//        var randomNumber:Int
//        
//        do {
//            randomNumber = self.generateRandomNumber(99)
//        } while (randomNumber == currentBalloonIndex)
        
//        self.currentBalloonIndex = randomNumber
        
        let balloon = self.ballons[self.currentBalloonIndex]
        
        self.balloonLabel.text = "Balloon \(balloon.number)"
        self.imageView.image = balloon.image
        
        self.currentBalloonIndex++;
    }
    
    func create99Ballons() {
        
        for (var index=0; index < 99; index++) {
            
            let randomNumber = Int(arc4random_uniform(UInt32(4)))
            
            println("The random number is \(randomNumber)" )
            
            var ballon = Ballon()
            ballon.number = index + 1
            
            switch randomNumber {
            case 0:
                ballon.image = UIImage(named: self.imageNames[randomNumber])
            case 1:
                ballon.image = UIImage(named: self.imageNames[randomNumber])
            case 2:
                ballon.image = UIImage(named: self.imageNames[randomNumber])
            case 3:
                ballon.image = UIImage(named: self.imageNames[randomNumber])
            default:
                println("Whoops we have something other then 0, 1, 2, 3. Random number is: \(randomNumber)")
            }
            
            //Add the balloon to the array
            self.ballons.append(ballon)
        }
    }
    
    func generateRandomNumber(limit:Int) -> Int {
        let randomNumber = Int(arc4random_uniform(UInt32(limit)))
        
        return randomNumber
    }


}

