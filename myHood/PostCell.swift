//
//  PostCell.swift
//  myHood
//
//  Created by Soroush Shahi on 8/8/16.
//  Copyright © 2016 Soroush. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        postImg.clipsToBounds = true
    }
    
    
    func configureCell (post : Post) {
        titleLbl.text = post.title
        descLbl.text = post.postDesc
        postImg.image = DataSerivce.instance.imageForPath(post.imagePath)
    }
}
