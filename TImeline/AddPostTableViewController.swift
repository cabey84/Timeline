//
//  AddPostTableViewController.swift
//  TImeline
//
//  Created by Chandi Abey  on 9/10/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import UIKit

//need to conform to 2 protocols - image picker lets us access camera and photo library. we need navigation controller delegate b/c it lets us balance between apps view and camera view, going back and forth between those two.
class AddPostTableViewController: UITableViewController, PhotoSelectViewControllerDelegate {
    
    //create an optional property image that is passed in from where?
    var image: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    /*
     Add Post Scene
     
     Implement the Add Post Table View Controller. You will use a static table view to create a simple form for adding a new post. Use three sections for the form:
     
     Section 1: Large button to select an image, and a UIImageView to display the selected image Section 2: Caption text field Section 3: Add Post button
     */
    
    

    @IBOutlet weak var captionTextField: UITextField!
    
    
    
    

    //MARK: - Delegates
    
    
    //captures a reference to the selected image and will then use the catpured reference to create a new post
    func photoSelectViewControllerSelectedImage(image: UIImage) {
        //HOW do you capture a reference to the selected image? image property defined is the image passed in?
        self.image = image
    }


    //NEED TO CHECK THIS SECTION!!
    @IBAction func addPostButtonTapped(sender: AnyObject) {
        // Add an IBAction to the 'Add Post' UIButton that checks for an image and caption. If there is an image and a caption, use the PostController to create a new Post and dismiss the view controller. If either the image or a caption is missing, present an alert directing the user to check their information and try again.
        //you can access the built-in elements in the Basic view with cell1.textLabel etc.
        
        //how to access the image in the imageView and textLabel in the second cell
        
        //Variables by default cannot be nil. That is why you are getting an error when trying to compare image to nil. You need to explicitly define your variable as optional:
        
        
        if let image = image,
            caption = captionTextField.text where captionTextField.text != "" {
            //create a new post
            PostController.sharedController.createPost(image, caption: caption)
            //dismiss the viewcontroller
            dismissViewControllerAnimated(true, completion: nil)
            
        } else {
            //present an alert directing the user to check their information and try again
            let checkAlert = UIAlertController(title: "Missing Information", message: "Image or caption missing. Please try again", preferredStyle: .Alert)
            
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: { (UIAlertAction) in
            })
            
            checkAlert.addAction(okAction)
            self.presentViewController(checkAlert, animated: true, completion: nil)
            
        }
    }

    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        // Add a 'Cancel' UIBarButtonItem as the left bar button item. Implement the IBAction to dismiss the view.
        dismissViewControllerAnimated(true) {
            
        }
        
    }
    
    

    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    
    //MARK:- PrepareforSegue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //check for segue identifier
        if segue.identifier == "ToPhotoSelectSegue" {
            //capture the destinationVC as the PhotoSelectVC (the child VC)
            if let embedController = segue.destinationViewController as? PhotoSelectViewController {
                //parent assigning itself as the childVC's delegate 
                embedController.delegate = self
            }
            
        }
    }
    
}
