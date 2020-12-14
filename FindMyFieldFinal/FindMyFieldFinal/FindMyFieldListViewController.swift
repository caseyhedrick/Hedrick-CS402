//
//  FindMyFieldListViewController.swift
//  FindMyField(FinalProject)
//
//  Created by user181417 on 12/10/20.
//

import UIKit

class FindMyFieldListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FindMyFieldController.fieldList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FindMyFieldCell")
        
        
        let currentField = FindMyFieldController.fieldList()[indexPath.row]
        
        cell?.textLabel?.text = currentField.fieldName
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        LocationController.startGPS()
        
        NotificationCenter.default.addObserver(self, selector: #selector(fieldWasUpdated(notification:)), name: NSNotification.Name("NEW_FIELD"), object: nil)
        
        FindMyFieldController.fetchData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @objc
    func fieldWasUpdated(notification:Notification){
        tableView.reloadData()
        
    }
    
    
}
