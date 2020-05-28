//
//  PostCell.swift
//  socialNetwork
//
//  Created by Mert Köksal on 22.05.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import UIKit
import Firebase

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
    
    
    func configureCell(post: Post, image: UIImage? = nil) {
//        postImage.image = post.imageURL
        caption.text = post.caption
        likesLabel.text = String(describing: post.likes)
        
        if image != nil {
            postImage.image = image
        } else {
            let imageURL = post.imageURL
            let ref = Storage.storage().reference(forURL: imageURL)
            ref.getData(maxSize: 2 * 1024 * 1024) { (data, error) in
                if error != nil {
                    print("Unable to retrieve image from fb storage")
                } else {
                    print("Image dowloaded from fb storage")
                    if let imageData = data {
                        if let image = UIImage(data: imageData) {
                            self.postImage.image = image
                            FeedVC.imageCache.setObject(image, forKey: post.imageURL as NSString)
                        }
                    }
                }
            }
        }
    }
        
}
