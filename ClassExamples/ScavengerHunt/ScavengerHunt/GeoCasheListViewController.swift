//
//  GeoCasheListViewController.swift
//  ScavengerHunt
//
//  Created by user181417 on 11/17/20.
//

import UIKit
import CoreData

class GeoCasheListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GeocacheController.geocacheList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GeoCacheCell")
        let currentGeoCache = GeocacheController.geocacheList()[indexPath.row]
        cell?.textLabel?.text = currentGeoCache.geocacheName
        
        return cell!
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        LocationController.startGPS()
        
        NotificationCenter.default.addObserver(self, selector: #selector(geoCacheWasUpdated(notification:)), name:NSNotification.Name ("NEW_GEOCACHE"), object: nil)
        
        let fetchReqest:NSFetchRequest = GeoCache.fetchRequest()
        
        do{
            let results = try DatabaseController.getContext().fetch(fetchReqest)
            if (results.count > 0){
                
            }
        }
        catch{
            print("error")
        }
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @objc
    func geoCacheWasUpdated(notification:Notification) {
        tableView.reloadData()
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
