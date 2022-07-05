//
//  SecondViewController.swift
//  CatchPatrick
//
//  Created by onur erdem on 4.07.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var TimeLbl: UILabel!
    @IBOutlet weak var ScoreLbl: UILabel!
    @IBOutlet weak var HighScoreLbl: UILabel!
    @IBOutlet weak var Img1: UIImageView!
    @IBOutlet weak var Img2: UIImageView!
    @IBOutlet weak var Img3: UIImageView!
    @IBOutlet weak var Img4: UIImageView!
    @IBOutlet weak var Img5: UIImageView!
    @IBOutlet weak var Img6: UIImageView!
    @IBOutlet weak var Img7: UIImageView!
    @IBOutlet weak var Img8: UIImageView!
    @IBOutlet weak var Img9: UIImageView!
    
    // Github Test
    //test2
    
    var score : Int = 0
    var highScore : Int = 0
    var timer = Timer()
    var countdown : Int = 0
    var newGame : Bool = true
    var patrickArray = [UIImageView]()
    var timer2 = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        patrickArray = [Img1,Img2,Img3,Img4,Img5,Img6,Img7,Img8,Img9]
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highScore")
        if storedHighScore == nil {
            HighScoreLbl.text = "High Score : 0"
        }
        
        if newGame {
            UserDefaults.standard.removeObject(forKey: "highScore")
            HighScoreLbl.text = "High Score : 0"
        }else{
            
            if let newscore = storedHighScore as? Int{
                highScore = newscore
                HighScoreLbl.text = "High Score : \(highScore)"
            }
            
            
            
        }
        
        timer2 = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hidePatrick), userInfo: nil, repeats: true)
        countdown = 20
        TimeLbl.text = "Time : \(countdown)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeCountdown), userInfo: nil, repeats: true)
        
        
        Img1.isUserInteractionEnabled = true
        Img2.isUserInteractionEnabled = true
        Img3.isUserInteractionEnabled = true
        Img4.isUserInteractionEnabled = true
        Img5.isUserInteractionEnabled = true
        Img6.isUserInteractionEnabled = true
        Img7.isUserInteractionEnabled = true
        Img8.isUserInteractionEnabled = true
        Img9.isUserInteractionEnabled = true
        
        let gestureRcognizer1 = UITapGestureRecognizer(target: self, action: #selector(catchPatrick) )
        let gestureRcognizer2 = UITapGestureRecognizer(target: self, action: #selector(catchPatrick) )
        let gestureRcognizer3 = UITapGestureRecognizer(target: self, action: #selector(catchPatrick) )
        let gestureRcognizer4 = UITapGestureRecognizer(target: self, action: #selector(catchPatrick) )
        let gestureRcognizer5 = UITapGestureRecognizer(target: self, action: #selector(catchPatrick) )
        let gestureRcognizer6 = UITapGestureRecognizer(target: self, action: #selector(catchPatrick) )
        let gestureRcognizer7 = UITapGestureRecognizer(target: self, action: #selector(catchPatrick) )
        let gestureRcognizer8 = UITapGestureRecognizer(target: self, action: #selector(catchPatrick) )
        let gestureRcognizer9 = UITapGestureRecognizer(target: self, action: #selector(catchPatrick) )

        Img1.addGestureRecognizer(gestureRcognizer1)
        Img2.addGestureRecognizer(gestureRcognizer2)
        Img3.addGestureRecognizer(gestureRcognizer3)
        Img4.addGestureRecognizer(gestureRcognizer4)
        Img5.addGestureRecognizer(gestureRcognizer5)
        Img6.addGestureRecognizer(gestureRcognizer6)
        Img7.addGestureRecognizer(gestureRcognizer7)
        Img8.addGestureRecognizer(gestureRcognizer8)
        Img9.addGestureRecognizer(gestureRcognizer9)
    }
    
    @objc func catchPatrick(){
        score += 1
        ScoreLbl.text = "Score : \(score)"
        
    }
    
    @objc func hidePatrick (){
        
        for patrick in patrickArray {
            patrick.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(patrickArray.count - 1)))
        patrickArray[random].isHidden = false
    }
    
    @objc func timeCountdown () {
        countdown -= 1
        TimeLbl.text = "Time : \(countdown)"
        
        if countdown == 0 {
            timer.invalidate()
            timer2.invalidate()
            
            if self.score > self.highScore {
                self.highScore = self.score
                UserDefaults.standard.set(self.highScore, forKey: "highScore")
                HighScoreLbl.text = "High Score : \(self.highScore)"
            }
            
            
            
            let aler = UIAlertController(title: "Time Up", message: "Game Over", preferredStyle: .alert)
            let alertBtn = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
            aler.addAction(alertBtn)
            self.present(aler, animated: true)
            
            for patrick in patrickArray {
                patrick.isHidden = true
            }
        }
    }
    
   
}
