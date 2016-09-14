//
//  PostController.swift
//  TImeline
//
//  Created by Chandi Abey  on 9/10/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import Foundation
import UIKit

//add and implement the PostController class that will be used for CRUD operations
class PostController {
    
    
    static let sharedController = PostController()
    
    
    var posts: [Post] = []
    
    
    // Implement the createPost function to initialize a Post with the image and a Comment with the caption text.
     func createPost(image: UIImage, caption: String) {
    
        //convert image received as parameter to NSData type, which is the type accepted in the Post initializer
        let photoNSData = UIImagePNGRepresentation(image)

        //initialize a Post object
        let post = Post(photoData: photoNSData)
        posts.append(post)
        
        //initialize a comment using caption string and the post we just created
        let comment = Comment(text: caption, post: post)
        
        //add caption to the comment property on the post we just created
        post.comments.append(comment)
        
        
    }
    
    //Add a addCommentToPost function that takes a text parameter as a String, and a Post parameter.
    //Implement the addCommentToPost function to call the appropriate Comment initializer and adds the comment to the appropriate post.
     func addCommentToPost(text: String, post: Post) {
        //create a comment
        let comment = Comment(text: text, post: post)
        //what about adding comment to appropriate post?
        post.comments.append(comment)
        
    }
    
    
    
    //filter the local posts array for posts that match
     func filterPosts(searchTerm: String) -> [Post] {
        //first need to access the individual post object
        //second need to access the comment property in the individual post object
        //third check to see if the comment property contains a string we are looking for 
        return posts.filter({$0.matchesSearchTerm(searchTerm)})
    }

}



 
