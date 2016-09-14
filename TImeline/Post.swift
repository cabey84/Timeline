//
//  Post.swift
//  TImeline
//
//  Created by Chandi Abey  on 9/10/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import Foundation
import UIKit

//timeline will use a simple non-persistent data model to locally represent data stored on CloudKit
//Post object will hold image data and comments
// While you will not implement sync in this portion of the project, it is important to recognize the need for syncing with CloudKit when designing your model.


class Post: SearchableRecord  {
    
    let photoData: NSData?
    let timestamp: NSDate
    //ask SKYLAR- if this is what we are supposed to do.
    var comments: [Comment]
    
    
    var photo: UIImage {
        // Add a computed property, photo that returns a UIImage initialized using the data in photoData.
        //first unwrap photoData and then unwrap image, both optionals. 
        guard let photoData = photoData,
            let image = UIImage(data: photoData) else { return UIImage() }
            return image
        
    }
    
    
    // Add an initializer that accepts photoData, timestamp, and comments array. Provide default values for the timestamp and comments arguments, so they can be ommitted if desired.
    init(photoData: NSData?, timestamp: NSDate = NSDate(), comments: [Comment] = []) {
        self.photoData = photoData
        self.timestamp = timestamp
        self.comments = comments
    }
        
    
    //Update the Post class to conform to the SearchableRecord protocol. Return true if any of the Post comments match, otherwise return false.
    
    func matchesSearchTerm(searchTerm: String) -> Bool {
        //what am I doing wrong here? What does contains expect in terms of a parameter?
        let matchingComments = comments.filter { $0.matchesSearchTerm(searchTerm) }
        if matchingComments.isEmpty {
            return false
        } else {
            return true
        }
    }
}

protocol SearchableRecord: class {
    
    func matchesSearchTerm(searchTerm: String) -> Bool 
}