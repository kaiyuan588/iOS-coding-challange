//
//  ViewController.swift
//  CustomItunes
//
//  Created by 低调 on 10/19/19.
//  Copyright © 2019 Kaiyuan Zhao. All rights reserved.
//

import UIKit
import AVFoundation

class MyTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var myTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    var cellId = "SongCell"
    private var rssItems: [RSSItem]?
    
    
    private let songs = SongsAPI.getSongs()
    
    static var audioPlayer : AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        setupNavigation()
        
        playingSoundWith(fileName: "sample")
        fetchData()
    }
    
    
    
    private func fetchData(){
        let feedParser = FeedParser()
        feedParser.parseXML(url: "http://feeds.skynews.com/feeds/rss/technology.xml") { (rssitems) in
            self.rssItems = rssitems
            self.myTableView.reloadSections(IndexSet(integer: 0), with: .left)
        }
    }
    func setupNavigation(){
        navigationItem.title = "Media"
        self.navigationController?.navigationBar.barTintColor = .lightGray
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
    }
    


        func playingSoundWith(fileName: String) {
            do {
                MyTableViewController.audioPlayer = try AVAudioPlayer(contentsOf: Bundle.main.url(forResource: fileName, withExtension: "mp3")!)
                MyTableViewController.audioPlayer.prepareToPlay()
                
            } catch {
                print(error)
            }
        }
    func setupTableView(){
        myTableView.frame = view.frame
        myTableView.register(SongsTableViewCell.self, forCellReuseIdentifier: cellId)
        myTableView.delegate = self
        myTableView.dataSource = self
        view.addSubview(myTableView)
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        
        myTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        myTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        myTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: cellId) as! SongsTableViewCell
//        cell.textLabel?.text = songs[indexPath.row].name
//        cell.pauseBtn.tag = indexPath.row
        cell.song = songs[indexPath.row]
        
        return cell
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    // testing


}

