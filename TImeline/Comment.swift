//
//  Comment.swift
//  TImeline
//
//  Created by Chandi Abey  on 9/10/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import Foundation

//create a comment model object that will hold user-submitted text comments for a specific Post
class Comment: SearchableRecord   {
    
    let text: String
    let timestamp: NSDate
    let post: Post
    
    
    init(text: String, timestamp: NSDate = NSDate(), post: Post) {
        self.text = text
        self.timestamp = timestamp
        self.post = post
    }
        
        
        //Update the Comment class to conform to the SearchableRecord protocol. Return true if text contains the search term, otherwise r func matchesSearchTerm(searchTerm: String) -> Bool {
        //what am I doing wrong here? What does contains expect in terms of a parameter? Character
    
    //ASK SKYLAR- why isnt this in a comment controller or a model controller? Is this how you handle if statements in a function expected to return a certain value? 
    func matchesSearchTerm(searchTerm: String) -> Bool {
        if text.lowercaseString.containsString(searchTerm.lowercaseString) {
            return true
        } else {
            return false
        }
    }
}