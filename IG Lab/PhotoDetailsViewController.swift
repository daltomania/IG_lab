//
//  PhotoDetailsViewController.swift
//  IG Lab
//
//  Created by Will Dalton on 8/26/15.
//  Copyright (c) 2015 daltomania. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {

    var photo = NSDictionary()
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameLabel.text = photo.valueForKeyPath("user.username") as! String
        
        let url = photo.valueForKeyPath("images.standard_resolution.url") as! NSString
        photoImageView.setImageWithURL(NSURL(string: url as! String)!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
