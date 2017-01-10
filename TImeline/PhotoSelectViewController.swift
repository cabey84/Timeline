//
//  PhotoSelectViewController.swift
//  TImeline
//
//  Created by Chandi Abey  on 9/13/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import UIKit

class PhotoSelectViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    weak var delegate: PhotoSelectViewControllerDelegate?
    
    
    @IBOutlet weak var selectedImageView: UIImageView!
    
    
    @IBOutlet weak var selectImageButton: UIButton!
    

    @IBAction func selectImageButtonTapped(sender: AnyObject) {
    
        //Add an IBAction to the 'Select Image' UIButton that assigns a static image to the image view (add a sample image to the Assets.xcassets that you can use for prototyping this feature), and removes the title text from the button. note: It is important to remove the title text so that the user no longer sees that a button is there, but do not remove the entire button, that way the user can tap again to select a different image.
        let imagePicker = UIImagePickerController()
        //set delegate for it
        imagePicker.delegate = self
        //give user the option to select from photo library or from device's camera if device has one - USE ALERTCONTROLLER!
        let actionSheet = UIAlertController(title: "Choose An Image", message: nil, preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .Default) { (_) in
            imagePicker.sourceType = .PhotoLibrary
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        let cameraAction = UIAlertAction(title: "Camera", style: .Default) { (_) in
            imagePicker.sourceType = .Camera
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        actionSheet.addAction(cancelAction)
        //documentation in uiimagepicker is that we need to check to see if the source type is accessible and available. For example, camera is not available on the simuator.
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            actionSheet.addAction(cameraAction)
        }
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
            actionSheet.addAction(photoLibraryAction)
        }
        presentViewController(actionSheet, animated: true, completion: nil)
        
        //remove the selectImageButton text
        selectImageButton.setTitle("", forState: UIControlState.Normal)
    }
    
    
    
    //there is a delegate method that comes with imagepicker that grabs the info we need and bring it back and allow us to have an image transferred from photo library and brought into app
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { return } //cast from type anyobject to UIImage
        selectedImageView.image = image
        dismissViewControllerAnimated(true, completion: nil)
        //call the delegate function in this method, passing the selected media to the delegate
        if let delegate = delegate {
            //if the delegate has been assigned, we call the delegate protocol and we pass in the image
            delegate.photoSelectViewControllerSelectedImage(image)
        }

        
        
    }
}



protocol PhotoSelectViewControllerDelegate: class {
    //passes image that was selected. This function will tell the assigned delegate (parent View Controller) what image the user selected
    func photoSelectViewControllerSelectedImage(image: UIImage)
}
