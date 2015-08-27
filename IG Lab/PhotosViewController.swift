//
//  PhotosViewController.swift
//  IG Lab
//
//  Created by Will Dalton on 8/26/15.
//  Copyright (c) 2015 daltomania. All rights reserved.
//

import UIKit
import AFNetworking


class PhotosViewController: UIViewController, UITableViewDataSource {

    var photos = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        //tableView.delegate = self

        let url = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=bdbdb36949e841f78ba3072b3134b0f6")!
        var request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var responseDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as! NSDictionary
            self.photos = responseDictionary["data"] as! NSArray
            
            self.tableView.rowHeight = 320
            self.tableView.reloadData()
            
            //NSLog("response: \(self.photos)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.photos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("daltomania.cell", forIndexPath: indexPath) as! PhotoViewCell
        
        let photo = self.photos[indexPath.row] as! NSDictionary
        let url = photo.valueForKeyPath("images.standard_resolution.url") as! NSString
        
        cell.imageView?.setImageWithURL(NSURL(string: url as! String)!)
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated:true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var vc = segue.destinationViewController as! PhotoDetailsViewController
        var indexPath = tableView.indexPathForCell(sender as! UITableViewCell)
        
        vc.photo = self.photos[indexPath!.row] as! NSDictionary
    }


}
