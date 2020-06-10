//
//  ConvertListCell.swift
//  Converter
//
//  Created by ely.assumpcao.ndiaye on 07/06/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit
import Reusable

class ConvertListCell: UITableViewCell, NibReusable {
    
    @IBOutlet weak var currencyLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(item: (initials: String, name: String)){
        self.currencyLbl.text = " \(item.initials) - \(item.name)"
    }
    
}
