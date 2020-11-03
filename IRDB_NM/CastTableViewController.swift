//
//  CastTableViewController.swift
//  IRDB_NM
//
//  Created by Nathan Mckenzie on 11/2/20.
//

import UIKit

class CastTableViewController: UITableViewController {
    
    var castListArray: [Cast]?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return castListArray?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "castCell", for: indexPath)

        // Configure the cell...
        
        // use the values in the array to make cast list cell pretty
        cell.textLabel?.text = castListArray?[indexPath.row].actorName
        //cell.detailTextLabel?.text = castListArray?[indexPath.row].role
        let Role = "-As-    "
        cell.detailTextLabel?.text = "\(Role)\(castListArray?[indexPath.row].role ?? "Role")"
        return cell
    }
    



   



}
