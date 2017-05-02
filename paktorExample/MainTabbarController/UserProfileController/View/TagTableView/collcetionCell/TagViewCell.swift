//
//  TagViewCell.swift
//  paktorExample
//
//  Created by 林羣珩 on 2017/4/24.
//  Copyright © 2017年 林羣珩. All rights reserved.
//

import UIKit
import SnapKit

enum CollectionCellType{
    case tag(Array<Tag>)
    case image(Array<UIImage>)
    case defaultType
}

struct Tag {
    
    var name: String?
    var selected = false
    
    init(name:String,selected:Bool) {
        self.name = name
        self.selected = selected
    }
}

class TagViewCell: UICollectionViewCell {
    
   static let tagViewCellID = "TagViewCellID"

    var label :UILabel = {
        let label  = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        return label
    }()
    var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = UIColor.gray
        return imageView
    }()
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupUI()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        addSubview(label)
        addSubview(imageView)
    }
    private func layout(){
        label.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.width.equalTo(self)
            make.height.equalTo(self)
        }
        imageView.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.width.equalTo(self)
            make.height.equalTo(self)
        }
    }
    
    func configureCell(_ cellData: CollectionCellType, indexPath:NSIndexPath) {
        self.label.isHidden = true
        self.imageView.isHidden = true
        switch cellData {
        case .tag(let tageArray):
            let tageData = tageArray[indexPath.row]
            self.label.isHidden = false
            self.label.text = tageData.name ?? ""
            self.label.textColor = tageData.selected ? UIColor.white : UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
            self.backgroundColor = tageData.selected ? UIColor(red: 0, green: 1, blue: 0, alpha: 1) : UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        case .image(let imageArray):
            let imageData = imageArray[indexPath.row]
            self.imageView.isHidden = false
            self.imageView.image = imageData
            break
        default:
            break
        }
        
    }
    
    
}