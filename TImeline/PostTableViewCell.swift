//
//  PostTableViewCell.swift
//  TImeline
//
//  Created by Chandi Abey  on 9/10/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import UIKit

//You will use a similar cell to display posts in multiple scenes in your application. Create a custom PostTableViewCell that can be reused in different scenes.
//Implement the scene in Interface Builder by creating a custom cell with an image view that fills the cell.
class PostTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var postImage: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   //add and implement an updateWithPost to update the image view with the Post's photo
    func updateWithPost(post: Post) {
        postImage.image = post.photo
        
        //Choose a height that will be used for your imageCells. To avoid worrying about resizing images or dynamic cell heights, you may want to use a consistent height for all of the image views in the app.
        //CHECK WITH SKYLAR!
        
    }

}


