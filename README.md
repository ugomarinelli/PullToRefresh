# Pull To Refresh :point_up_2:
------

## 1 - On a Table view :chart_with_downwards_trend:

![ljJEmq](http://i.makeagif.com/media/8-01-2016/ljJEmq.gif)



:hamburger: Create a Table view in your interface and drag it to **create an outlet**




:hamburger: Create a refresh control object **as a global variable** :



```swift
var refreshControl: UIRefreshControl!
```



:hamburger: In the viewDidLoad, initialize your refresh control and **add it to your table view**




```swift
// Initialize the refresh control.
refreshControl = UIRefreshControl()
refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
refreshControl.addTarget(self, action: #selector(TableViewVC.refresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
tView.addSubview(refreshControl)
```


:hamburger: **Implement the refresh method** that will be called when the user refreshes your table view


```swift
//Method called when we pull to refresh
func refresh(sender:AnyObject) {
//Do Something
//End refresh
self.refreshControl.endRefreshing()
}
```


## 2 - On a UIView :tv:

![NZj8f4](http://i.makeagif.com/media/8-01-2016/NZj8f4.gif)



:hamburger: **Create a ScrollView** in the interface builder and create an outlet




:hamburger:  In the interface builder, select the scroll view and make sure to check **"Bounce Vertically"** :



![aM8hfB](http://i.makeagif.com/media/8-01-2016/aM8hfB.gif)

:hamburger:  Drag a view **inside the Scroll View hierarchy** within the interface builder and create an outlet




:hamburger: Create a refresh control object **as a global variable** :



```swift
var refreshControl: UIRefreshControl!
```

![aM8hfB](http://i.makeagif.com/media/8-01-2016/aM8hfB.gif)
**C**.  Drag a view **inside the Scroll View hierarchy** within the interface builder and create an outlet


:hamburger: In the viewDidLoad, **instantiate your refresh control and add it to your scrollView**




```swift
// Initialize the refresh control.
refreshControl = UIRefreshControl()
refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
refreshControl.addTarget(self, action: #selector(UIViewVC.refresh(_:)), forControlEvents: UIControlEvents.ValueChanged)

//Adding refreshing to scroll view
self.scrollView.addSubview(refreshControl)
```




:hamburger: Implement the refresh method that will be called when the user refreshes your table view:
```swift
//Method called when we pull to refresh
func refresh(sender:AnyObject) {
//Do Something
//End refresh
self.refreshControl.endRefreshing()
}
```

