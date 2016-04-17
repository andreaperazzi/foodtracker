//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by Andrea Perazzi on 17/04/16.
//  Copyright © 2016 Andrea Perazzi. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    
    // MARK: - Properties
    
    var meals = [Meal]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data
        loadSampleMeals()
        
    }
    
    
    // MARK: - Helper methods
    
    // This is a helper method to load sample data into the app
    func loadSampleMeals() {
        
        let photo1 = UIImage(named: "meal1")!
        let meal1 = Meal(name: "Caprese Salad", photo: photo1, rating: 4)!
        
        let photo2 = UIImage(named: "meal2")!
        let meal2 = Meal(name: "Chicken and Potatoes", photo: photo2, rating: 5)!
        
        let photo3 = UIImage(named: "meal3")!
        let meal3 = Meal(name: "Pasta with Meatballs", photo: photo3, rating: 3)!
        
        meals += [meal1, meal2, meal3]
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return meals.count
        
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier
        let cellIdentifier = "MealTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MealTableViewCell

        // Fetches the appropriate meal for the data source layout
        
        let meal = meals[indexPath.row]
        
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating

        return cell
    }


    // MARK: - Navigation
    
    @IBAction func unwindToMealList(sender:UIStoryboardSegue) {
        
        if let sourceViewController = sender.sourceViewController as? MealViewController, meal = sourceViewController.meal {
            
            // Add a new meal
            
            let newIndexPath = NSIndexPath(forRow: meals.count, inSection: 0)
            meals.append(meal)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            
        }
        
        
    }



}
