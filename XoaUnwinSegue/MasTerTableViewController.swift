//
//  MasTerTableViewController.swift
//  XoaUnwinSegue
//
//  Created by dohien on 5/21/18.
//  Copyright © 2018 dohien. All rights reserved.
//

import UIKit

class MasTerTableViewController: UITableViewController {

    var numbers = ["mot", "hai","ba"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numbers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = String(numbers[indexPath.row])

        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            numbers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
     @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        guard let detailViewConTroller = unwindSegue.source as? DetailViewController else { return  }
        if let text = tableView.indexPathForSelectedRow {
        numbers[text.row] = String(detailViewConTroller.number ?? "")
        }else {
            numbers.append(String(detailViewConTroller.number ?? ""))
        }
        tableView.reloadData()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? DetailViewController {
            if let index = tableView.indexPathForSelectedRow {
                detailViewController.number = numbers[index.row]
            }
        }
        
    }
    

}
