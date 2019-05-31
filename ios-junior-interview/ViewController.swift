//
//  ViewController.swift
//  ios-junior-interview
//
//  Created by egmars.janis.timma on 31/05/2019.
//  Copyright © 2019 egmars.janis.timma. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var items = [Item]()
    var checkArray = ["car","car","car","car","car","car","car","car"]
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlString: String
            urlString = "http://www.recipepuppy.com/api/"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                print(url)
                return
            }
        }
        showError()
    }

    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        if let jsonItems = try? decoder.decode(Items.self, from: json) {
            items = jsonItems.results
            print("Items are: \(items)")
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = checkArray[indexPath.row]
        cell.textLabel?.text = item
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = items[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

