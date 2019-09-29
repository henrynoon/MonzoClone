//
//  Transaction.swift
//  MonzoClone
//
//  Created by Henry Noon on 24/09/2019.
//  Copyright © 2019 Henry Noon. All rights reserved.
//

import UIKit

struct Transaction {

    var id: String?
    var created: String?
    var description: String?
    var amount: Int?
    var fees: Fees?
    var currency: String?
    var merchant: Merchant?
    var notes: String?
    var metadata: Metadata?
    var labels: String?
    var account_balance: Float?
    var attachments: Attachments?
    var international: String?
    var category: String?
    var is_load: Bool?
    var settled: String?
    var local_amount: Float?
    var local_currency: String?
    var updated: String?
    var account_id: String?
    var user_id: String?
    var counterparty: Counterparty?
    var scheme: String?
    var dedupe_id: String?
    var originator: Bool?
    var include_in_spending: Bool?
    var can_be_excluded_from_breakdown: Bool?
    var can_be_made_subscription: Bool?
    var can_split_the_bill: Bool?
    var can_add_to_tab: Bool?
    var amount_is_pending: Bool?
}

struct Fees {
    
}

struct Metadata {
    var ledger_insertion_id: String?
    var mastercard_approval_type: String?
    var mastercard_auth_message_id: String?
    var mastercard_lifecycle_id: String?
    var mcc: String?
    var notes: String?
    
}

struct Attachments {
    
}

struct Counterparty {
    
}


// Below are specific to the Merchant

struct Merchant {
    var id: String?
    var group_id: String?
    var created: String?
    var name: String?
    var logo: String?
    var emoji: String?
    var category: String?
    var online: Bool?
    var atm: Bool?
    var address: Address?
    var updated: String?
    var metadata: MerchantMetadata?
    var disable_feedback: Bool?
}

struct Address {
    var short_formatted: String?
    var formatted: String?
    var address: String?
    var city: String?
    var region: String?
    var country: String?
    var postcode: String?
    var latitude: Float?
    var longitude: Float?
    var zoom_level: Int?
    var approximate: Bool?
}

struct MerchantMetadata {
    var created_for_merchant: String?
    var created_for_transaction: String?
    var foursquare_category: String?
    var foursquare_category_icon: String?
    var foursquare_id: String?
    var foursquare_website: String?
    var google_places_icon: String?
    var google_places_id: String?
    var google_places_name: String?
    var provider: String?
    var provider_id: String?
    var suggested_name: String?
    var suggested_tags: String?
    var twitter_id: String?
    var website: String?
}





//var logo: String?
//var title: String?
//var subtitle: String?
//var price: String?
