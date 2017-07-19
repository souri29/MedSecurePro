//
//  PairViewController.swift
//  BAER
//
//  Created by Shouki Souri on 7/14/17.
//  Copyright © 2017 Shouki Souri. All rights reserved.
//

import UIKit

class PairViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let pairBlueValueStatusLocal = blueStatus {
            print("blueStatus Value is \(pairBlueValueStatusLocal)")
            
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let pairBlueValueStatusLocal = blueStatus {

        switch  pairBlueValueStatusLocal {
        case 2, 4:
            createAlert(titleText: "Bluetooth Disabled", messageText: "Swipe up from the button of the screen and activate Bluetooth")
            //print("testing")
        case 0:
            createAlert(titleText: "Bluetooth Unknown Error", messageText: "Swipe up from the button of the screen and activate Bluetooth")
            //print("Unknown")
        case 1:
            createAlert(titleText: "Bluetooth is Resetting", messageText: "Swipe up from the button of the screen and activate Bluetooth")
            //print("resetting")
        case 3:
            createAlert(titleText: "Unauthorize Bluetooth Action", messageText: "Swipe up from the button of the screen and activate Bluetooth")
            //print("Unauthorized")
        case 5:
            createAlert(titleText: "Bluetooth Enabled", messageText: "Swipe up from the button of the screen and activate Bluetooth")
            //print("Bluetooth is on")
        default:
            break;
    }
        }
}
    
    func createAlert(titleText: String, messageText: String) {
        let alert = UIAlertController(title: titleText, message: messageText, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
