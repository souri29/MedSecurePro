//
//  MenuViewController.swift
//  BAER
//
//  Created by Shouki Souri on 7/10/17.
//  Copyright © 2017 Shouki Souri. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //let title_arr = ["Home", "About Us", "Help"]
    
    let title_arr = ["Support-50", "Bluetooth-30", "Brain-30", "Alarm-30", "Headset-30", "Help-30"]
    
    @IBOutlet weak var menu_tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menu_tableView.delegate = self
        menu_tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return title_arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menu_cell") as! MenuTableViewCell
        cell.myImage.image = UIImage(named: title_arr[indexPath.row] + ".png")
        cell.label_title.text = title_arr[indexPath.row]
        return (cell)
        
    }
    
}
