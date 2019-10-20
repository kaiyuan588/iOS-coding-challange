//
//  SongsTableViewCell.swift
//  CustomItunes
//
//  Created by 低调 on 10/19/19.
//  Copyright © 2019 Kaiyuan Zhao. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class SongsTableViewCell: UITableViewCell{
 
    var isOn = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraint()
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    
    var item: RSSItem! {
        didSet {
            
            nameLabel.text = item.name
            typeLabel.text = item.type
//            profileImageView.loadImage(url: imageLabel.text!)
            imageLabel.text = item.image
        }
    }
    
    func setupConstraint(){
        self.contentView.addSubview(imageLabel)
        containerView.addSubview(nameLabel)
        self.contentView.addSubview(containerView)
        self.contentView.addSubview(typeLabel)
        
        imageLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        imageLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        imageLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imageLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.imageLabel.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:typeLabel.leadingAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.imageLabel.trailingAnchor, constant: 20).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        typeLabel.widthAnchor.constraint(equalToConstant:50).isActive = true
        typeLabel.heightAnchor.constraint(equalToConstant:50).isActive = true
        typeLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20).isActive = true
        typeLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20).isActive = true
//        typeLabel.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)

    }

    let profileImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
       return img
    }()
    
    
    let nameLabel:UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 10)
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0;
            label.lineBreakMode = NSLineBreakMode.byWordWrapping
            return label
    }()
    

    
    let typeLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        return label
    }()
    
    let containerView:UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.clipsToBounds = true
      return view
    }()
    
    let imageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        return label
    }()
    


    
//    @objc func btnTapped(_ sender: UIButton){
//           print("btn tapped")
//        activeBtn(bool: !isOn)
//    }
//    func activeBtn(bool: Bool){
//        isOn = bool
//        let image = bool ? UIImage(named: "stop") : UIImage(named: "pause")
//        if isOn {
//            MyTableViewController.audioPlayer.play()
//        }else {
//            MyTableViewController.audioPlayer.stop()
//        }
//        pauseBtn.setBackgroundImage(image, for: .normal)
//
//    }
    
}

