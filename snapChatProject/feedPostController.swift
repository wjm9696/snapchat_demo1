//
//  feedPostController.swift
//  snapChatProject
//
//  Created by Jimmy on 3/8/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit


class feedPostController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var feedTableView: UITableView!
    @IBOutlet weak var feedTypeLabel: UILabel!
    var image:UIImage?
    var selectedFeed: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTableView.delegate = self
        feedTableView.dataSource = self
        //selectedImage.image = null

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threads.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedTypeCell") as! FeedTableCell
        cell.feedType.text = threadNames[indexPath.item]
        return cell
        

        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedFeed = threadNames[indexPath.item]
        self.feedTypeLabel.text = self.selectedFeed
    }
    
    @IBAction func pressPost(_ sender: UIButton) {
        if let feed = self.selectedFeed{
            let feedObj = FeedInfo(image: self.image!, date:Date(), from:posterName)
            threads[feed]!.append(feedObj)
            let alert = UIAlertController(title: "Congrats", message: "It's posted", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it", style: UIAlertActionStyle.default, handler: { (action) in
                //self.performSegue(withIdentifier: "postToPicture", sender: nil)
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
