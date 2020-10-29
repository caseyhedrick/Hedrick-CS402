//
//  ViewController.swift
//  Meetings
//
//  Created by user181417 on 10/15/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Meeting Cell")
        
        cell?.textLabel?.text = "Test"
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func addMeetingTapped(_ sender: Any) {
        let meetingViewController = (storyboard?.instantiateViewController(identifier: "MeetingViewController"))!
        present(meetingViewController, animated: true, completion: nil)
    }
}

