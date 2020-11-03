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

        let nav = self.navigationController?.navigationBar
      
        // 2
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.init(red: 245/255, green: 196/255, blue: 72/255, alpha: 1)
    }

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return castListArray?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "castCell", for: indexPath)

        cell.textLabel?.text = "\(castListArray?[indexPath.row].actorName ?? "")            -as- "
        
        cell.detailTextLabel?.text = castListArray?[indexPath.row].role

        return cell
    }
    



   



}
