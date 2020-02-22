//
//  TestTableViewCell.swift
//  TestModule
//
//  Created by Mohamed Akl on 2/22/20.
//  Copyright © 2020 Mohamed Akl. All rights reserved.
//

import UIKit

protocol TestTableViewDelegate: class {
    func didPressTablebutton(cityId: Int, cityName: String )
}

class TestTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var buttonName: UIButton!
    
    weak var delegate: TestTableViewDelegate?
    
    var selectedCityId: Int?
    var selectedCityName: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        backView.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.6, blue: 0.5725490196, alpha: 1)
    }
    
    @IBAction func didPressButton(_ sender: Any) {
        delegate?.didPressTablebutton(cityId: selectedCityId ?? 0, cityName: selectedCityName ?? "")
    }
}
