//
//  UIViewVC.swift
//  PullToRefreshSampleSwift
//
//  Created by UGO MARINELLI on 01/08/16.
//  Copyright © 2016 UGO MARINELLI. All rights reserved.
//

import UIKit

class UIViewVC: UIViewController {
    @IBOutlet var viewToRefresh: UIView!
    @IBOutlet var scrollView: UIScrollView!
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        // Initialize the refresh control.
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControlEvents.valueChanged)
        
        //Adding refreshing to scroll view
        self.scrollView.addSubview(refreshControl)
    }
    
    //Method called when we pull to refresh
    func refresh(sender:AnyObject) {
        //refreshing the view
        DispatchQueue.main.async {
            //Changing bg color of the view
            self.viewToRefresh.backgroundColor = self.getRandomColor()
            self.refreshControl.endRefreshing()
        }
    }
    
    //Returns random color
    func getRandomColor() -> UIColor{
        
        let randomRed:CGFloat = CGFloat(drand48())
        
        let randomGreen:CGFloat = CGFloat(drand48())
        
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }

}
