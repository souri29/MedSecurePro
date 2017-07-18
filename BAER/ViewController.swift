//
//  ViewController.swift
//  BAER
//
//  Created by Shouki Souri on 7/5/17.
//  Copyright © 2017 Shouki Souri. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBPeripheralManagerDelegate {
    
    var menu_vc : MenuViewController!
    var myBTManager: CBPeripheralManager?
    
    @IBAction func slideMenu(_ sender: UIBarButtonItem) {
        
        if AppDelegate.menu_bool {
            show_menu()
        }else {
            close_menu()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myBTManager = CBPeripheralManager(delegate: self, queue: nil, options: nil)

        // Adding an image to the main controller top image
        //self.navigationItem.titleView = UIImageView(image: UIImage(named: "Brain-30"))
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "BRAINQUE_Q_30_30"))
        
        menu_vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondtoGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondtoGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
        
    }
    
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
    print(#function)
    if peripheral.state == CBManagerState.poweredOn {
    print("Broadcasting...")
    //    myBTManager!.startAdvertising(_broadcastBeaconDict)
    } else if peripheral.state == CBManagerState.poweredOff {
    print("Stopped")
    myBTManager!.stopAdvertising()
    } else if peripheral.state == CBManagerState.unsupported {
    print("Unsupported")
    } else if peripheral.state == CBManagerState.unauthorized {
    print("This option is not allowed by your application")
    } else if peripheral.state == CBManagerState.resetting {
    print("Resetting")
    } else if peripheral.state == CBManagerState.unknown {
    print("unknown")
    
    }
    
    }

    func respondtoGesture(gesture : UISwipeGestureRecognizer)
    {
        switch gesture.direction {
        case UISwipeGestureRecognizerDirection.right:
            //print("Right")
            show_menu()
        case UISwipeGestureRecognizerDirection.left:
            //print("Left")
            close_on_swipe()
        default:
            break
        }
    }
    
    func close_on_swipe()
    {
        if AppDelegate.menu_bool {
            show_menu()
        }else {
            close_menu()
        }

    }
    
    
    func show_menu()
    {
        UIView.animate(withDuration: 0.3) { ()-> Void in
        self.menu_vc.view.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        self.menu_vc.view.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        self.addChildViewController(self.menu_vc)
        self.view.addSubview(self.menu_vc.view)
        AppDelegate.menu_bool = false
        }
    }
    
    func close_menu()
    {
        
        UIView.animate(withDuration: 0.3, animations: { ()-> Void in
            self.menu_vc.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height) }) { (finished) in
        self.menu_vc.view.removeFromSuperview()
                
        }
        AppDelegate.menu_bool = true
    }

}

