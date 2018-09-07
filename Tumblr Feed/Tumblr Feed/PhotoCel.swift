//
//  PhotoCel.swift
//  Tumblr Feed
//
//  Created by Alonzo Contreras on 9/6/18.
//  Copyright © 2018 Alonzo Contreras. All rights reserved.
//

import UIKit

class PhotoCel: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCel") as! PhotoCel
        
        return cell
    }

}
