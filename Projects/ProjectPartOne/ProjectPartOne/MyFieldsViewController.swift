//
//  MyFieldsViewController.swift
//  ProjectPartOne
//
//  Created by user181417 on 10/29/20.
//

import UIKit

class MyFieldsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var dataArray:Array<String> = ["Saved Field 1", "Saved Field 2", "Saved Field 3", "Saved Field 4", "Saved Field 5", "Saved Field 6"]
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = dataArray[indexPath.row]
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
                if( indexPath.row % 2 == 0 ){
                    let detailsViewController = (storyboard?.instantiateViewController(identifier: "DetailsViewController"))!
                    present(detailsViewController, animated: true, completion: nil)
                }
                else{
                    tableView.cellForRow(at: indexPath)?.accessoryType = .none
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
