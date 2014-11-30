//
//  Customer.swift
//  LemonadeStandAssignment
//
//  Created by iMac on 23/11/14.
//  Copyright (c) 2014 mrodriguez. All rights reserved.
//

import Foundation

class Customer {
    
    private var lemonadeTastePreference = 0.0
    
    init(){
        
        createCustomerTastePreference()
    }
    
    private func createCustomerTastePreference(){
        
        lemonadeTastePreference = Double(arc4random_uniform(UInt32(11)))/10
        println("Created a customer with lemon taste preference of \(lemonadeTastePreference)")
    }
    
    func getCustomersTastePreference() -> Lemonade.lemonadeRatioRange{
        
        if(lemonadeTastePreference < 0.4){
            return Lemonade.lemonadeRatioRange.ACIDIC
        }
        else if(lemonadeTastePreference < 0.6){
            return Lemonade.lemonadeRatioRange.EQUAL_PARTS
        }
        else {
            return Lemonade.lemonadeRatioRange.DILUTED
        }
    }
}
