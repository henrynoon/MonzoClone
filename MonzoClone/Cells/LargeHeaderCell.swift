//
//  Header1Cell.swift
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
        shop.font = .systemFont(ofSize: 20, weight: .regular)
        shop.textColor = .black
        return shop
    }()
    
    let addressLabel: UILabel = {
       let address = UILabel()
        address.font = .systemFont(ofSize: 12, weight: .light)
        address.textColor = .gray
        return address
    }()
    
    let priceLabel: UILabel = {
        let price = UILabel()
        price.font = .systemFont(ofSize: 24, weight: .regular)
        price.textColor = .black
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
    
    var paymentInfoHeader: PaymentInfoHeader? {
        didSet {
            priceLabel.text = paymentInfoHeader?.amount
            addressLabel.text = [(paymentInfoHeader?.address)!, (paymentInfoHeader?.postcode)!].compactMap{$0}.joined(separator: " ")
            mapLatitude = (paymentInfoHeader?.latitude!)!
            mapLongitude = (paymentInfoHeader?.longitude!)!
            shopLogo.image = UIImage(named: (paymentInfoHeader?.logo)!)
            shopNameLabel.text = paymentInfoHeader?.name
            
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
