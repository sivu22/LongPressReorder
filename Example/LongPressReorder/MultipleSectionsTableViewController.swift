//
//  MultipleSectionsTableViewController.swift
//  LongPressReorder
//
//  Created by Cristian Sava on 01/10/2017.
//  Copyright © 2017 Cristian Sava. All rights reserved.
//

import UIKit
import LongPressReorder

class MultipleSectionsTableViewController: UITableViewController {

    var reorderTableView: LongPressReorderTableView!
    var rows: [Int] = [Int]()
    
    let numSections = 3
    let initialRows = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<numSections {
            rows += [initialRows]
        }
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        reorderTableView = LongPressReorderTableView(tableView)
        reorderTableView.delegate = self
        reorderTableView.enableLongPressReorder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return numSections
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section " + String(section + 1)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "multipleCell", for: indexPath)

        let title = "Cell \(indexPath.section + 1).\(indexPath.row + 1)"
        if indexPath.row == 0 && indexPath.section < numSections - 1 {
            cell.textLabel?.text = title + " not moving"
        } else {
            cell.textLabel?.text = title
        }
        
        return cell
    }
}

// MARK: - Long press drag and drop reorder

extension MultipleSectionsTableViewController {
    
    override func positionChanged(currentIndex: IndexPath, newIndex: IndexPath) {
        if currentIndex.section != newIndex.section {
            rows[newIndex.section] += 1
            rows[currentIndex.section] -= 1
        }
    }
    
    override func startReorderingRow(atIndex indexPath: IndexPath) -> Bool {
        if indexPath.section == numSections - 1 {
            return true
        } else if indexPath.row > 0 {
            return true
        }
        
        return false
    }
    
    override func allowChangingRow(atIndex indexPath: IndexPath) -> Bool {
        if indexPath.section == numSections - 1 {
            return true
        } else if indexPath.row > 0 {
            return true
        }
        
        return false
    }
}
