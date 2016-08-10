//
//  ViewController.swift
//  myHood
//
//  Created by Soroush Shahi on 8/8/16.
//  Copyright © 2016 Soroush. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    @IBOutlet weak var tableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        DataSerivce.instance.loadPosts()
        tableView.delegate = self
        tableView.dataSource = self
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onPostsLoaded:", name:"postsLoaded", object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataSerivce.instance.loadedPosts.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 87.0
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
            cell.configureCell(DataSerivce.instance.loadedPosts[indexPath.row])
            return cell
        }
        else{
            let cell = PostCell()
            cell.configureCell(DataSerivce.instance.loadedPosts[indexPath.row])
            return cell
        }
    }
    
    func onPostsLoaded (notif: AnyObject) {
        print("notified")
        tableView.reloadData()
        
    }


}

