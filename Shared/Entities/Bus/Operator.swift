//
//  Operator.swift
//  Osheaga Routes
//
//  Created by user on 01/11/20.
//

import Foundation

struct Operator: Codable {
    
    var id: String
    
    var source_id: Int?
    var profile_id: Int?
    var name: String?
    var url: String?
    var logo_url: String?
    
    var display_name: String?
    var sellable: Bool?
    var fuzzy_prices: Bool?
    
//          "sell_tickets_cutoff": {
//            "hours": 1
//          },
//          "amenities": {
//            "classes": {
//              "Normal": {
//                "display_name": "Economy",
//                "wifi": true,
//                "toilet": true,
//                "ac": true,
//                "food": false,
//                "refreshment": false,
//                "power_outlets": true,
//                "tv": false,
//                "bus_attendant": false,
//                "leg_room": false
//              },
//              "Economy": {
//                "display_name": "Economy",
//                "wifi": true,
//                "toilet": true,
//                "ac": true,
//                "food": false,
//                "refreshment": false,
//                "power_outlets": true,
//                "tv": false,
//                "bus_attendant": false,
//                "leg_room": false
//              }
//            }
//          },
//          "source": "greyhound_us",
//          "referral_deal": false,
//          "display_url": null,
//          "fraud_check": "iovation",
//          "terms": {
//            "refund": false,
//            "exchange": true,
//            "bag_allowed": true,
//            "piece_of_id": false,
//            "boarding_requirement": "printed_tkt",
//            "extra_bag_policy": true,
//            "use_new_ticket": false,
//            "exchange_cutoff": 24,
//            "nb_checked_bags": 1,
//            "kg_by_bag": 25,
//            "nb_carry_on": 1,
//            "extra_bag_cost": 1500
//          }
//        }
}
