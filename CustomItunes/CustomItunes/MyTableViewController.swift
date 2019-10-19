//
//  ViewController.swift
//  CustomItunes
//
//  Created by 低调 on 10/19/19.
//  Copyright © 2019 Kaiyuan Zhao. All rights reserved.
//

import UIKit

class MyTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var myTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    var cellId = "cellId"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
    }
    
    
    func setupTableView(){
        myTableView.frame = view.frame
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        myTableView.delegate = self
        myTableView.dataSource = self
        view.addSubview(myTableView)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: cellId)
       
        
        cell?.translatesAutoresizingMaskIntoConstraints = false
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    



}

