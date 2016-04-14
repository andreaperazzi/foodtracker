//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let items = ["One", "Two"]
let notificationsVC = UITableViewController()

class NotificationsDataSource: NSObject, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

class NotificationsTableDelegate: NSObject, UITableViewDelegate {
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.textLabel?.text = items[indexPath.row]
    }
}

let dataSource = NotificationsDataSource()
let tableDelegate = NotificationsTableDelegate()

notificationsVC.tableView.dataSource = dataSource
notificationsVC.tableView.delegate = tableDelegate

XCPlaygroundPage.currentPage.liveView = notificationsVC

