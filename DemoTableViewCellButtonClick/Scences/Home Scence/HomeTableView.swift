//
//  HomeTableView.swift
//  DemoTableViewCellButtonClick
//
//  Created by Mohamed Akl on 2/22/20.
//  Copyright © 2020 Mohamed Akl. All rights reserved.
//

import UIKit

class HomeTableView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let cellIdentifier = "TestTableViewCell"
    
    private var cityId = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    private var cityNames = ["Cairo", "Alex", "Mansoura", "Kafr El-Shiekh", "Tanta", "Fayoum", "Domyat", "Ras ElBar", "Ain El-Sokhna", "Sharm El-Shiekh"]
    
    /*
     you can update this by creating Module and passing it to cell
     var cityData: [yourModel] = []
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
}

extension HomeTableView: UITableViewDelegate , UITableViewDataSource {
    
    //MARK:- TableView Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityId.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestTableViewCell", for: indexPath) as! TestTableViewCell
        cell.selectedCityId = cityId[indexPath.row]
        cell.selectedCityName = cityNames[indexPath.row]
        cell.buttonName.setTitle(cityNames[indexPath.row], for: .normal)
        
        /*
         you can passing data to TestTableViewCell and configure in TestTableViewCell Class
         cell.configCell = cityData[indexPath.row]
         and in configureCell func
         selectedCityId = cityData[indexPath.row].id
         selectedCityName = cityData[indexPath.row].name
         */
        
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension HomeTableView: TestTableViewDelegate {
    
    func didPressTablebutton(cityId: Int, cityName: String ) {
        print("Selected CityName is: \(cityName)  and  CityId is: \(cityId)")
    }
}
