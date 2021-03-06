//
//  PhotosViewController.swift
//  Tumblr Feed
//
//  Created by Alonzo Contreras on 8/29/18.
//  Copyright © 2018 Alonzo Contreras. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotosViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    var posts: [[String: Any]] = []

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImages()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 300
        
    }

    func fetchImages(){
        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                
                let responseDictionary = dataDictionary["response"] as! [String: Any]
                self.posts = responseDictionary["posts"] as! [[String: Any]]
                
            }
        }
        self.tableView.reloadData()
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCel", for: indexPath) as! PhotoCel
        
        let post = posts[indexPath.row]
        
        if let photos = post["photos"] as? [[String: Any]]{
            let photo = photos[0]
            
            let originalSize = photo["original_size"] as! [String: Any]
            
            let urlString = originalSize["url"] as! String
            
            let url = URL(string: urlString)
            
            cell.postImageView.af_setImage(withURL: url!)

        }
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
