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

class SongsTableViewCell: UITableViewCell {
 
    var isOn = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraint()

        
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    func setupConstraint(){
        self.contentView.addSubview(profileImageView)
        containerView.addSubview(nameLabel)
        self.contentView.addSubview(containerView)
        self.contentView.addSubview(pauseBtn)
        
        profileImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.profileImageView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:pauseBtn.leadingAnchor, constant:-150).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        
        pauseBtn.widthAnchor.constraint(equalToConstant:50).isActive = true
        pauseBtn.heightAnchor.constraint(equalToConstant:50).isActive = true
        pauseBtn.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20).isActive = true
        pauseBtn.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20).isActive = true
        pauseBtn.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)

    }
    
    
    var song: Songs? {
        didSet {
            guard let songItem = song else {return}
            if let name = songItem.name {
                profileImageView.image = UIImage(named: "musicPhoto")
                nameLabel.text = name
            }

            
        }
    }
    
    let profileImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
       return img
    }()
    
    
    let nameLabel:UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
    }()
    

    
    let pauseBtn: UIButton = {
        
        let btn = UIButton(type: .system)
        btn.contentMode = .scaleAspectFill
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 13
        btn.clipsToBounds = true
        btn.setBackgroundImage(UIImage(named: "pause"), for: .normal)

        return btn
    }()
    
    let containerView:UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.clipsToBounds = true
      return view
    }()
    
    @objc func btnTapped(_ sender: UIButton){
           print("btn tapped")
        activeBtn(bool: !isOn)
    }
    func activeBtn(bool: Bool){
        isOn = bool
        let image = bool ? UIImage(named: "stop") : UIImage(named: "pause")
        if isOn {
            MyTableViewController.audioPlayer.play()
        }else {
            MyTableViewController.audioPlayer.stop()
        }
        pauseBtn.setBackgroundImage(image, for: .normal)

    }
    
}
