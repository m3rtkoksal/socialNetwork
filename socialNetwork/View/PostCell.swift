//
//  PostCell.swift
//  socialNetwork
//
//  Created by Mert Köksal on 22.05.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likesLabel: UILabel!
    
    
    func configureCell(post: Post) {
//        postImage.image = post.imageURL
        caption.text = post.caption
        likesLabel.text = String(describing: post.likes)
        
        
    }
    
}
