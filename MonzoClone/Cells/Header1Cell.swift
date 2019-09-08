//
//  Header1Cell.swift
//  MonzoClone
//
//  Created by Henry Noon on 07/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit
import MapKit

class Header1Cell: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mapView)
        mapView.fillSuperview()
        setUpStackViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let mapView: MKMapView = {
        let map = MKMapView()
        return map
    }()
    
    let shopLogo: UIImageView = {
        let logo = UIImageView(image: #imageLiteral(resourceName: "Sainsbury's Logo"))
        
        let logoSize = CGSize(width: 50, height: 50)
        
        logo.widthAnchor.constraint(equalToConstant: logoSize.width).isActive = true
        logo.heightAnchor.constraint(equalToConstant: logoSize.height).isActive = true
        
        logo.layer.cornerRadius = 8
        logo.clipsToBounds = true
        
        return logo
    }()
    
    let paddingView: UIView = {
       let padding = UIView()
        return padding
    }()
    
    let shopNameLabel: UILabel = {
        let shop = UILabel()
        shop.text = "Sainsbury's"
        shop.font = .systemFont(ofSize: 20, weight: .regular)
        shop.textColor = .black
        return shop
    }()
    
    let addressLabel: UILabel = {
       let address = UILabel()
        address.text = "8-12 Worple Rd, Wimbledon SW19 4DD"
        address.font = .systemFont(ofSize: 12, weight: .light)
        address.textColor = .gray
        return address
    }()
    
    let priceLabel: UILabel = {
        let price = UILabel()
        price.text = "£5.45"
        price.font = .systemFont(ofSize: 24, weight: .regular)
        price.textColor = .black
        return price
    }()
    
    fileprivate func setUpStackViews() {
        
        let topHorizontalStackView = UIStackView(arrangedSubviews: [shopLogo, paddingView])
        topHorizontalStackView.axis = .horizontal
        topHorizontalStackView.spacing = 100
        addSubview(topHorizontalStackView)
        topHorizontalStackView.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        
        let middleHorizontalStackView = UIStackView(arrangedSubviews: [shopNameLabel, priceLabel])
        middleHorizontalStackView.axis = .horizontal
        middleHorizontalStackView.spacing = 100
        addSubview(middleHorizontalStackView)
        middleHorizontalStackView.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        
        let verticalStackView = UIStackView(arrangedSubviews: [topHorizontalStackView, middleHorizontalStackView, addressLabel])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 5
        addSubview(verticalStackView)
        verticalStackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
    }
}
