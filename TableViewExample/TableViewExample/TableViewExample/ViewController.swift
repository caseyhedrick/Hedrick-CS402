//
//  ViewController.swift
//  TableViewExample
//
//  Created by user181417 on 10/8/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataArray:Array<String> = ["Thai", "Chinese", "Mexican", "Colombian", "Hungarian", "German" ]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = dataArray[indexPath.row]
        
        print(indexPath.row)
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if (indexPath.row % 2 == 0){
            let detailsViewController = (storyboard?.instantiateViewController(identifier: "DetailsViewController"))!
            present(detailsViewController, animated: true, completion: nil)    }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
    }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row % 2 == 0){
        return 60
    }
        else{
            return 300
        
        }
}
    
}
