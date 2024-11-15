//
//  ViewController.swift
//  Nearby Places
//
//  Created by A7med Fekry on 14/11/2024.
//

import UIKit
import Kingfisher

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var viewModel : HomeViewModel!
    var result :ApiResponse?

    @IBOutlet weak var connectionImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

         viewModel = HomeViewModel()
         viewModel.bindResultToHomeView = {[weak self] in
             DispatchQueue.main.async{
                 self?.result = self?.viewModel.result
                // self?.tableView.reloadData()
                     self?.connectionImageView.isHidden = true
                     self?.tableView.isHidden = false
                 self?.tableView.reloadData()

             }
         }
    }

    
    
    // MARK: - UITableViewDataSource methods

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VenueTableViewCell
        
        cell.nameLabel.text = result?.response?.venues?[indexPath.row].name
        cell.addressLabel.text = self.concatenateAddress(from: result?.response?.venues?[indexPath.row].location?.formattedAddress ?? [""])
        if ((result?.response?.venues?[indexPath.row].categories?.isEmpty) == false){
            cell.categoryLabel.text = result?.response?.venues?[indexPath.row].categories?[0].shortName
            var imageURL =  URL(string: (result?.response?.venues?[indexPath.row].categories?[0].icon?.prefix ?? "") + "bg_88" + (result?.response?.venues?[indexPath.row].categories?[0].icon?.suffix ?? ".png"))
            print(imageURL!)
            cell.categoryImageView.kf.setImage(with: imageURL)

        }else{
            cell.categoryLabel.text = "General"

        }
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Example: Set specific height for each row or based on content
        return 150
    }
    
    func concatenateAddress(from array: [String]) -> String {
        var result = ""
        for string in array {
            result += string
        }
        return result
    }



}

