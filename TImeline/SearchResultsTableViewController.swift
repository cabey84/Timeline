//
//  SearchResultsTableViewController.swift
//  TImeline
//
//  Created by Chandi Abey  on 9/10/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController {

    var resultsArray: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

    //trying to manually call the toPostDetail segue from the Search scene 
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //capture the sending cell  and send selected cell so search scene can get the selected post 
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        //tell scene's presentingViewController to performSEgueWithIdentifier. in this case, the presenting view controller of the search results scene is the timeline scene so this step will manually call the performSegueWithIdentiier on the search scene
        self.presentingViewController?.performSegueWithIdentifier("postDetailFromSearchSegue", sender: cell)
        //send selected cell so Search scene can get the selected Post
    }



    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resultsArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("resultsCell", forIndexPath: indexPath) as? PostTableViewCell
        let post = resultsArray[indexPath.row]
        cell?.updateWithPost(post)
        return cell ?? PostTableViewCell()
    }




   
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        //when sending info to a detailVC, need to ensure VC knows which context user is working with- full table list
//         if segue.identifier == "postDetailSegue" {
//        
//            //check if tabelView can get an indexPath for the sender
//            if let indexPath = tableView.indexPathForSelectedRow?.row,
//                //if yes, that means cell was from Search's scene's tabelview - ASK SKYLAR FOR EXPLANATION!
//                destinationVC = segue.destinationViewController as? PostDetailTableViewController {
//                tablePost =
//                destinationVC.post = post
//            }
//        
//            } else {
//                //if not, cell is from Search Result scene's tableView and user tapped a search results. if this is the case, capture post from results Array on searchResultscontroller
//               //note you can access searchResultsController.searchResultsController as? SearchResultsTableViewController
//                if let destinationVC = segue.destinationViewController as? PostDetailTableViewController {
//                    let searchPost = searchResultsController.searchResultsController as?
//            
//                    destinationVC.post =
//            
//                
//                    
//            }
//        }
//    }

}



