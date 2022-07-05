//
//  ViewController.swift
//  CatchPatrick
//
//  Created by onur erdem on 4.07.2022.
//

import UIKit

class ViewController: UIViewController {

    var bestScore : Int = 0
    var resumeGame : Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func NewBtn(_ sender: Any) {
        resumeGame = false
        performSegue(withIdentifier: "ToSecondVC", sender: nil)
    }
    
    @IBAction func ResumeBtn(_ sender: Any) {
        resumeGame = true
        performSegue(withIdentifier: "ToSecondVC", sender: nil)
    }
    
    @IBAction func AboutBtn(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToSecondVC" {
            let destinationVC = segue.destination as! SecondViewController
            if resumeGame {
                destinationVC.newGame = false
            }else{
                destinationVC.newGame = true
            }
        }
    }
    
}

