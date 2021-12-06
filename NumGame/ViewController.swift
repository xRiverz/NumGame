//
//  ViewController.swift
//  NumGame
//
//  Created by admin on 05/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var guess : Int = 0
    
    @IBOutlet weak var guessField: UITextField!
    @IBAction func guessPressed(_ sender : UIButton){
        check(Int(guessField.text ?? "0")!)
        guessField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        update()
    }
    func update(){
        guess = Int.random(in: 1...100)
    }
    
    func check(_ number : Int){
        if number > guess{
            alert("Wrong","\(number) is too high")
        }else if number < guess {
            alert("Wrong","\(number) is too low")
        }else {
            alert("Right","\(number) is Correct")
        }
    }
    func alert(_ title : String,_ message: String){
        if title == "Wrong"{
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title : "Again", style: UIAlertAction.Style.cancel, handler : {_ in
                
            }))
            
            alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(red: 1, green : 0 , blue : 0, alpha: 0.3)
            self.present(alert, animated:true , completion : nil)
        }else {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "Play Again ?", style: UIAlertAction.Style.cancel, handler: { _ in
                self.update()
            }))
            alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(red: 0, green : 1 , blue : 0, alpha: 0.3)
            alert.view.tintColor = UIColor.white
            self.present(alert, animated:true , completion : nil)
        }
    }
}


