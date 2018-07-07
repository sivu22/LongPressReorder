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
    var indexes: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 1...30 {
            indexes.append(String(i))
        }
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        reorderTableView = LongPressReorderTableView(tableView, scrollBehaviour: .early)
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
        return 30
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exampleCell", for: indexPath)

        if indexPath.row == 0 {
            cell.textLabel?.text = "Cell 1 not moving"
        } else {
            cell.textLabel?.text = "Cell \(indexes[indexPath.row])"
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
    
    override func positionChanged(currentIndex: IndexPath, newIndex: IndexPath) {
        // Simulate a change in model
        indexes.swapAt(currentIndex.row, newIndex.row)
    }
}

