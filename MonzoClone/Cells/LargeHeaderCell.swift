//
//  LargeHeaderCell.swift
//  (Previously PaymentInfoHeaderCell.swift)
//  (Previously Header1Cell.swift)
//  MonzoClone
//
//  Created by Henry Noon on 07/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit
import MapKit

class LargeHeaderCell: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mapView)
        mapView.fillSuperview()
        setUpGradientLayer()
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
        let logo = UIImageView()
        let logoSize = CGSize(width: 57, height: 57)
        logo.widthAnchor.constraint(equalToConstant: logoSize.width).isActive = true
        logo.heightAnchor.constraint(equalToConstant: logoSize.height).isActive = true
        logo.layer.cornerRadius = 12
        logo.clipsToBounds = true
        return logo
    }()
    
    let paddingView: UIView = {
        let padding = UIView()
        return padding
    }()
    
    let shopNameLabel: UILabel = {
        let shop = UILabel()
        shop.font = .systemFont(ofSize: 20, weight: .regular)
        shop.textColor = UIColor(red: 0.08, green: 0.14, blue: 0.24, alpha: 1)
        return shop
    }()
    
    let addressLabel: UILabel = {
       let address = UILabel()
        address.font = .systemFont(ofSize: 12, weight: .light)
        address.textColor = UIColor(red: 0.63, green: 0.65, blue: 0.69, alpha: 1)
        return address
    }()
    
    let priceLabel: UILabel = {
        let price = UILabel()
        price.font = .systemFont(ofSize: 24, weight: .regular)
        price.textColor = UIColor(red: 0.08, green: 0.14, blue: 0.24, alpha: 1)
        return price
    }()
    
    var mapLatitude: CLLocationDegrees = {
        let lat = CLLocationDegrees()
        return lat
    }()
    
    var mapLongitude: CLLocationDegrees = {
        let long = CLLocationDegrees()
        return long
    }()
    
    fileprivate func setUpStackViews() {
        
        let topHorizontalStackView = UIStackView(arrangedSubviews: [shopLogo, paddingView])
        topHorizontalStackView.axis = .horizontal
        topHorizontalStackView.spacing = 100
        
        let middleHorizontalStackView = UIStackView(arrangedSubviews: [shopNameLabel, priceLabel])
        middleHorizontalStackView.axis = .horizontal
        middleHorizontalStackView.distribution = .equalCentering
        
        let verticalStackView = UIStackView(arrangedSubviews: [topHorizontalStackView, middleHorizontalStackView, addressLabel])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 5
        addSubview(verticalStackView)
        verticalStackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 15, bottom: 15, right: 15))
    }
    
    
    fileprivate func setUpGradientLayer() {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor]
        gradientLayer.locations = [0.3, 0.8, 1]
        
        let gradientContainerView = UIView()
        addSubview(gradientContainerView)
        gradientContainerView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        gradientContainerView.layer.addSublayer(gradientLayer)

        gradientLayer.frame = self.bounds
        gradientLayer.frame.origin.y -= bounds.height
    }
    
    fileprivate func setUpMap() {
        
        let location = CLLocationCoordinate2D(latitude: mapLatitude, longitude: mapLongitude)
        let zoom = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: location, span: zoom)
        mapView.setRegion(region, animated: true)
        
        let pin = CustomPin(pinLocation: location)
        mapView.addAnnotation(pin)

        mapView.isZoomEnabled = false
        mapView.isScrollEnabled = false
        mapView.isUserInteractionEnabled = false
    }
    
    var transaction: Transaction? {
        didSet {
            guard let currency = transaction?.currency else {return}
            
            if let amount = transaction?.amount {
                priceLabel.formatCurrency(amount: amount, currency: currency)
            }
            if let address = transaction?.merchant?.address?.short_formatted {
                addressLabel.text = address
            }
            if let latitude = transaction?.merchant?.address?.latitude {
                mapLatitude = latitude
            }
            if let longitude = transaction?.merchant?.address?.longitude {
                mapLongitude = longitude
            }
            if let logo = transaction?.merchant?.logo {
                shopLogo.loadImageUsingUrlString(urlString: logo)
            }
            if let name = transaction?.merchant?.name {
                shopNameLabel.text = name
            }
            setUpMap()
        }
    }
}

class CustomPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
    init(pinLocation: CLLocationCoordinate2D) {
        coordinate = pinLocation
    }
}
