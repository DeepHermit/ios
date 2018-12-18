//
//  TableViewController.swift
//  实验13 第二题
//
//  Created by apple on 2018/12/03.
//  Copyright © 2018年 apple. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var citys:[City] = [City]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        citys.append(City(id: "101010100", name: "北京"))
        citys.append(City(id: "101270101", name: "成都"))
        citys.append(City(id: "101020100", name: "上海"))
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
        return citys.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = citys[indexPath.row].name
        return cell
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let svc = segue.destination as? WeatherViewController{
            svc.id = citys[(tableView.indexPath(for: sender as! UITableViewCell)?.row)!].id
        }
    }
    

}
