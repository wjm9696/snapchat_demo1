//
//  feedListController .swift
//  snapChatProject
//
//  Created by Jimmy on 3/9/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit
class feedListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var currentImage: UIImageView!
    @IBOutlet weak var feedOuterTable: UITableView!
    let recognizer = UITapGestureRecognizer()
    var currentFeed: FeedInfo?
    override func viewDidLoad() {
        super.viewDidLoad()
        feedOuterTable.delegate = self
        feedOuterTable.dataSource = self
        currentImage.isHidden = true
        currentImage.isUserInteractionEnabled = true
        recognizer.addTarget(self, action: #selector(self.imageHasBeenTapped))
        currentImage.addGestureRecognizer(recognizer)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        feedOuterTable.reloadData()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionName = threadNames[section]
        return threads[sectionName]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "outerCell") as! postedTableCell
        let feedType = threadNames[indexPath.section]
        let currentFeed = threads[feedType]![indexPath.row]
        cell.from.text = currentFeed.from
        let dateObj = currentFeed.date!
        let timeLapse = -dateObj.timeIntervalSinceNow
        let seconds: Int = Int(timeLapse)
        //let mm: Int = Int((timeLapse - Double(seconds)) * 100)
        let minutes: Int = seconds / 60
        //let realSeconds = seconds % 60
        let timeString = String(minutes)
        cell.time.text = timeString+" minutes ago"
        if(currentFeed.read)!{
            cell.indicator.image = #imageLiteral(resourceName: "read")
            
        }else{
            cell.indicator.image = #imageLiteral(resourceName: "unread")
        }
        
        return cell
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return threadNames.count

    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return threadNames[section]
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let feedType = threadNames[indexPath.section]
        self.currentFeed = threads[feedType]![indexPath.row]
        let image = self.currentFeed!.image
//        performSegue(withIdentifier: "feedListToImage", sender: image)
        if(self.currentFeed?.read == false){
            self.tabBarController?.tabBar.isHidden = true
            self.currentImage.isHidden = false
            self.currentImage.image = image
            self.currentFeed?.read = true
            feedOuterTable.reloadData()
        }
    }
    
    func imageHasBeenTapped(){
        self.currentImage.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
        
        
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destinationVC = segue.destination as? imageShowController {
//            if let image = sender as! UIImage?{
//                destinationVC.image = image
//            }
//        }
//    }
//
    
    

    
    

    

}
