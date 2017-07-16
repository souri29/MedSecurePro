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
    
    let title_arr = ["Bluetooth", "Headset Settings", "Settings", "Help"]
    
    @IBOutlet weak var menu_tableView: UITableView!
    
/*
    func myLabel () -> UILabel {
        let label = UILabel()
        label.text = "Hello"
        label.textColor = UIColor.white
        return label
    }
*/
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menu_tableView.delegate = self
        menu_tableView.dataSource = self
        
        
        // Adding Header and Footer Views
        let headerView = UIView()
        headerView.backgroundColor = UIColor(red:0.04, green:0.19, blue:0.43, alpha:0.6)
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
        
        //myLabel().frame = CGRect (x: view.frame.width / 2 - 100, y: view.frame.height / 2 - 100, width: 200, height: 50)
        //view.addSubview(myLabel())
        
        
        let footerView = UIView()
        footerView.backgroundColor = UIColor(red:0.04, green:0.19, blue:0.43, alpha:0.6)
        
        footerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 30)
        
        menu_tableView.tableHeaderView = headerView
        menu_tableView.tableFooterView = footerView
        
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
