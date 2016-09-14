//
//  PostListTableViewController.swift
//  TImeline
//
//  Created by Chandi Abey  on 9/10/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController, UISearchResultsUpdating {
    
    
    /* INSTRUCTIONS:
     Implement the view hierarchy in Storyboards. The app will have :
     - Timeline tableview that will
     - also use a Search Controller to display search results.
     - Both the Timeline view and the Search Results view will display a list of Post objects and segue to a Post detail view.
     - Navigation Controller should have a Plus (+) button that
     - presents a modal Add Post scene that will allow the user to select a photo, add a caption, and submit the photo.
     
     -Add a UITableViewController Timeline scene, embed it in a UINavigationController, add a Plus (+) button as the right bar button.
     -Add a PostListTableViewController subclass of UITableViewController and assign it to the Timeline scene
     -Add a UITableViewController Post Detail scene, add a segue to it from the Timeline scene
     - Add a PostDetailTableViewController subclass of UITableViewController and assign it to the Post Detail scene
     
     - Add a UITableViewController Add Post scene, embed it into a UINavigationController,
     - add a modal presentation segue to it from the Plus (+) button on the Timeline scene
     note: Because this scene will use a modal presentation, it will not inherit the UINavigationBar from the Timeline scene
     Add a AddPostTableViewController subclass of UITableViewcontroller and assign it to the Add Post scene.
     
     Add a UITableViewcontroller Search Results scene. It does not need a relationship to any other view controller.
     note: You will implement this scene in Part 2 when setting up the UISearchController on the Search scene
     Add a SearchResultsTableViewController subclass of UITableViewController and assign it to the Search Results scene.
     
     
     
     */
    
    
    
    
    
    
    
    
    
    
    
    var searchController: UISearchController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchController()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    
    
    /*
     Implement the UITableViewDataSource functions
     note: The final app does not need to support any editing styles, but you may want to include support for editing while developing early stages of the app.
     Implement the prepareForSegue function to check the segue identifier, capture the detail view controller, index path, selected post, and assign the selected post to the detail view controller.
     note: You may need to quickly add a post property to the PostDetailTableViewController.
     */
    
    
    //MARK:-  Search Controller function
    
    func setUpSearchController() {
        //first identify the storyboard we are in, and capture the resultsController from the storyboard
        let resultsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("resultsTVC")
        //go up above and create an instance of UISearchController, instnatiates the UISearchController using what we captured
        searchController = UISearchController(searchResultsController: resultsController)
        guard let searchController = searchController else { return }
        //set the searchResults updater to self
        searchController.searchResultsUpdater = self
        //hide navigatoin bar
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.placeholder = "search For Post"
        //if you run into a problem with segue, going to the presenting VC which is navigation. Ask Austin about "self" ASK AUSTIN!!
        self.definesPresentationContext = true
        
        //add the searchcontroller's searchbar as the table header's view
        tableView.tableHeaderView = searchController.searchBar
        
    }
    //this method is required by UISearchResultsUpdating protocol
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        //unwrap the text that comes from the search bar
        guard let text = searchController.searchBar.text,
            //capture the resultsController- NOT sure I understand what is happening here, ask SKYLAR
            resultsViewController = searchController.searchResultsController as? SearchResultsTableViewController else { return }
        //ASK SKYLAR- It says to understand the relationship between 2 VCs.
        //assign filterded posts to resultsArray
        resultsViewController.resultsArray = PostController.sharedController.filterPosts(text.lowercaseString)
        //reload tableView
        resultsViewController.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PostController.sharedController.posts.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell  {
        let cell = tableView.dequeueReusableCellWithIdentifier("postImageCell", forIndexPath: indexPath) as? PostTableViewCell
        let post = PostController.sharedController.posts[indexPath.row]
        // Configure the cell...
        cell?.updateWithPost(post)
        return cell ?? PostTableViewCell()
    }
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "postDetailSegue" {
            if let detailVC = segue.destinationViewController as? PostDetailTableViewController,
                let indexPath = tableView.indexPathForSelectedRow?.row {
                detailVC.post = PostController.sharedController.posts[indexPath]
            }
        }
        
        if segue.identifier == "postDetailFromSearchSegue" {
            if let detailVC = segue.destinationViewController as? PostDetailTableViewController,
                let indexPath = (searchController?.searchResultsController as? SearchResultsTableViewController)?.tableView.indexPathForSelectedRow?.row,
                //getting only the searched for entries and pulling them into the view 
                let searchTerm = searchController?.searchBar.text?.lowercaseString {
                let posts = PostController.sharedController.posts.filter({$0.matchesSearchTerm(searchTerm)})
                detailVC.post = posts[indexPath]
            }
        }
            
    }
}
    
    





 