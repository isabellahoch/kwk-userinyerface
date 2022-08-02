//
//  PreviousAttemptsTableViewController.swift
//  UserInyerface
//
//  Created by Scholar on 7/29/22.
//

import UIKit
import CoreData

class PreviousAttemptsTableViewController: UITableViewController {
    
    var attempts : [Attempt] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getAttempts() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataAttempts = try? context.fetch(Attempt.fetchRequest()) as? [Attempt] {
                attempts = coreDataAttempts
                tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return number of items in data source array
        return attempts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // remember to copy the below identifier into the identifier box for the prototype cell in your storyboard!
        let cell = tableView.dequeueReusableCell(withIdentifier: "attemptCellIdentifier", for: indexPath)

        let attempt = attempts[indexPath.row]
        
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"

        let formattedDate = dateFormatter.string(from: attempt.dateStarted!)
        
        if let record = attempt.record {
            cell.textLabel?.text = "\(formattedDate) | \(record)"
        }

        return cell
    }

    // supports conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

//    allows user to delete an item by swiping
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            attempts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
