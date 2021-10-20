//
//  CardSelectionVC.swift
//  Card WorkOut
//
//  Created by Abdirizak Hassan on 10/19/21.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    @IBOutlet var cardImageView: UIImageView!
    
    @IBOutlet var buttons: [UIButton]!
    
    var cards: [UIImage] = Card.allValues
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTime()
        
        for btn in buttons {
            btn.layer.cornerRadius = 10
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
    }
    
    func startTime(){
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage(){
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    @IBAction func stopBtnTapped(_ sender: UIButton) {
        timer?.invalidate()
    }

    @IBAction func restartBtnTapped(_ sender: UIButton) {
        timer?.invalidate()
        startTime()
    }
    

    
}
