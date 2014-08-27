//
//  FaceTVC.swift
//  Swiftly Parse
//
//  Created by Arthur Boia on 8/26/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.
//

import UIKit

let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height

class FaceTVC: UITableViewController {

    var faces: [AnyObject] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Parse.setApplicationId("RZCHgNt7Z6LKypUFt5jvyjj61LQGnOhIDDCl7I65"
            , clientKey: "m3OLNZg5EbMLsUnLnFIHkRQ2WsMVz9nSzzUzN0XW")
        self.refreshData()
        
        var nc = NSNotificationCenter.defaultCenter()
        nc.addObserverForName("faceSave", object: nil, queue: NSOperationQueue.mainQueue()) {(notification:NSNotification!) -> Void in
         
            self.refreshData()
            
        }

    }
    
      func refreshData() {
       
        
        var query = PFQuery (className: "Faces")
        
        query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]!, error: NSError!) -> Void in
           
            self.faces = objects
            self.tableView.reloadData()
        }
        
        
    }

   
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
       
        
        return faces.count
    }

   
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as FaceCell
        
        var faceInfo = faces[indexPath.row] as PFObject
        
        var file = faceInfo.objectForKey("image") as PFFile
        
        cell.faceView.image = UIImage(data: file.getData())
        
        return cell
    }
    @IBAction func getPhoto(sender: UIBarButtonItem) {

        
        }


   
    @IBAction func newFace(sender: UIBarButtonItem) {
        
        let navC = UINavigationController(rootViewController: IWAViewController())
        
        self.navigationController.presentViewController(navC, animated: true) { () -> Void in
            
            
        }
        
        
    }
}





// Uncomment the following line to preserve selection between presentations
// self.clearsSelectionOnViewWillAppear = false

// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
// self.navigationItem.rightBarButtonItem = self.editButtonItem()





/*
// Override to support conditional editing of the table view.
override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
// Return NO if you do not want the specified item to be editable.
return true
}
*/

/*
// Override to support editing the table view.
override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
if editingStyle == .Delete {
// Delete the row from the data source
tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
} else if editingStyle == .Insert {
// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view

/*
// Override to support conditional rearranging of the table view.
override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
// Return NO if you do not want the item to be re-orderable.
return true
}
*/

/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
// Get the new view controller using [segue destinationViewController].
// Pass the selected object to the new view controller.
}
*/
}
}
*/

/*
// Override to support rearranging the table view.
override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {



}
*/