//
//  ExampleTableViewController.swift
//  LongPressReorder
//
//  Created by Cristian Sava on 27/11/2016.
//  Copyright © 2016 Cristian Sava. All rights reserved.
//

import UIKit
import LongPressReorder

class ExampleTableViewController: UITableViewController {
    
    var reorderTableView: LongPressReorderTableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        reorderTableView = LongPressReorderTableView(tableView)
        reorderTableView.delegate = self
        reorderTableView.enableLongPressReorder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exampleCell", for: indexPath)

        if indexPath.row == 0 {
            cell.textLabel?.text = "Cell 1 not moving"
        } else {
            cell.textLabel?.text = "Cell \(indexPath.row + 1)"
        }

        return cell
    }
}

// MARK: - Long press drag and drop reorder

extension ExampleTableViewController {
    
    override func startReorderingRow(atIndex indexPath: IndexPath) -> Bool {
        if indexPath.row > 0 {
            return true
        }
        
        return false
    }
    
    override func allowChangingRow(atIndex indexPath: IndexPath) -> Bool {
        if indexPath.row > 0 {
            return true
        }
        
        return false
    }
}

