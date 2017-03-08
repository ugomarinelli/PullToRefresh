//
//  ViewController.swift
//  PullToRefreshSampleSwift
//
//  Created by UGO MARINELLI on 01/08/16.
//  Copyright © 2016 UGO MARINELLI. All rights reserved.
//

import UIKit

class TableViewVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
   
    @IBOutlet var tView: UITableView!
    var refreshControl: UIRefreshControl!
    var tableArray = [Int]()
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting delegates for our Table view
        tView.delegate = self;
        tView.dataSource = self;
        
        // Initialize the refresh control.
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControlEvents.valueChanged)

        tView.addSubview(refreshControl)
    }
    

    //Method called when we pull to refresh
    public func refresh(sender:AnyObject) {
        //Adding value to the array
        count += 1
        tableArray.append(count)
        
        //reloading the table view with new data
        DispatchQueue.main.async {
            self.tView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    
    // MARK: - UITableViewDataSource
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        
        cell.textLabel!.textAlignment = .center
        cell.textLabel?.text = "\(tableArray[indexPath.row])"
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //If table array is empty we create a label in the middle of the tview
        if self.tableArray.count == 0 {
            let emptyLabel = UILabel(frame: CGRect(x:0,y:0, width:self.view.bounds.size.width, height:self.view.bounds.size.height))
            emptyLabel.text = "No Data, Pull to refresh to get data"
            emptyLabel.textAlignment = NSTextAlignment.center
            self.tView.backgroundView = emptyLabel
            return 0
        } else {
            //If we do have data 
            self.tView.backgroundView = nil
            return self.tableArray.count
        }
    }


}

