//
//  PostDetailTableViewController.swift
//  TImeline
//
//  Created by Chandi Abey  on 9/10/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import UIKit
import MessageUI

class PostDetailTableViewController: UITableViewController {

      var post: Post?
    /*
     Post Detail Scene
     
     Implement the Post Detail View Controller. This scene will be used for viewing post images and comments. Users will also have the option to add a comment, share the image, or follow the user that created the post
 
    */
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    
    //MARK: - IB Outlets
    
    
    @IBOutlet weak var postDetailImage: UIImageView!
    
    @IBOutlet weak var toolbar: UIToolbar!
    
    
    //initialize UIActivityControllers with Post's image adn text of the first comment as the sharehaable objects and present the UIActivityController 
    @IBAction func shareButtonTapped(sender: AnyObject) {
        guard let image = postDetailImage.image,
                firstComment = post?.comments[0].text
        else { return}
        let controller = UIActivityViewController(activityItems: [image, firstComment], applicationActivities: nil)
        presentViewController(controller, animated: true, completion: nil)
    }
    
  

    
    @IBAction func commentButtonTapped(sender: AnyObject) {
        //Add an IBAction for the 'Comment' button.
        presentNewCommentAlert()
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    
    //create a new function to present an alertController
    func presentNewCommentAlert() {
        let alertcontroller = UIAlertController(title: "Add New Comment", message: "", preferredStyle: .Alert)
        
        alertcontroller.addTextFieldWithConfigurationHandler { (commentTextField: UITextField) -> Void in
            commentTextField.placeholder = "Enter comment"
        }
        
        
        //Add OK and cancel actions
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (UIAlertAction) in
            //dismiss alertcontroller when cancelAction is pressed
            alertcontroller.dismissViewControllerAnimated(true, completion: nil)
           
        }
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {
            (action : UIAlertAction!) -> Void in
            // Any text fields that have been added to the UIAlertController instance are held as an optional array textFields are held in the same order as were added to the UIAlertController. The property is an optional however as no text fields may have been added so we first need to unwrap the array to access its contents.
            //AM I IMPLEMENTING THIS PART CORRECTLY?
            if let commentTextField = alertcontroller.textFields?.first,
                comment = commentTextField.text where comment != "",
                let post = self.post {
                PostController.sharedController.addCommentToPost(comment, post: post)
                self.tableView.reloadData()
            }
        })
        alertcontroller.addAction(cancelAction)
        alertcontroller.addAction(okAction)
        self.presentViewController(alertcontroller, animated: true, completion: nil)
    }
            
    
    

    
    
    @IBOutlet weak var followPostButtonTapped: UIBarButtonItem!
    
    @IBAction func followPostButtonTapped(sender: AnyObject) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Implement dynamic heights by setting the tableView.rowHeight and tableView.estimatedRowHeight in the viewDidLoad.
         //how to set dynamic height
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80
    }

 

    //MARK:- Update function
    //Add an updateWithPost function that will update the scene with the details of the post. Implement the function by setting the imageView.image and reloading the table view if needed.
    func updateWithPost() {
        //dont forget to create an IBOutlet in order to update imageView.image
        if let post = self.post {
            postDetailImage.image = post.photo
            self.tableView.reloadData()
        }
    }
    

    // MARK: - Table view data source
    //DONT FORGET TO IMPLEMENT THESE FUNCTIONS. SHOULD THE POST PROPERTY ABOVE BE AN ARRAY?

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //if there has been a post that has been passed through the segue
        guard let post = self.post else { return 0 }
        //access the comments property in that post
        return post.comments.count
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("postDetailCell", forIndexPath: indexPath)
        //if there has been a post that has been passed through the segue
        if let post = self.post {
            //access individual comment in the post and fill each cell with a comment
            let comment = post.comments[indexPath.row]
            cell.textLabel?.text = comment.text
        }
        return cell
    }
   

    
}
