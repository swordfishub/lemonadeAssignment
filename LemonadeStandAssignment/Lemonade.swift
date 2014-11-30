//
//  Lemonade.swift
//  LemonadeStandAssignment
//
//  Created by iMac on 23/11/14.
//  Copyright (c) 2014 mrodriguez. All rights reserved.
//

import Foundation

class Lemonade {
    
    // MARK: private attributes
    
    private var lemons = 0
    private var iceCubes = 0
    private var lemonateRatio = 0.0
    
    enum lemonadeRatioRange{
        case ACIDIC
        case EQUAL_PARTS
        case DILUTED
    }
    
    // MARK: constructors
    
    init(lemons:Int, iceCubes:Int){
        
        self.lemons = lemons
        self.iceCubes = iceCubes
        
        createLemonadeRatio()
    }
    
    // MARK: public methods
    
    func setQuantityOfLemons(lemons:Int) -> Lemonade{
        self.lemons = lemons;
        return self
    }
    
    func setQuantityOfIceCubes(iceCubes:Int) -> Lemonade{
        self.iceCubes = iceCubes;
        return self
    }
    
    func getLemonadeTaste() -> lemonadeRatioRange {
        
        if(lemonateRatio>1){
            return lemonadeRatioRange.ACIDIC
        }
        else if(lemonateRatio==1){
            return lemonadeRatioRange.EQUAL_PARTS
        }
        else{
            return lemonadeRatioRange.DILUTED
        }
    }
    
    // MARK: private methods
    
    private func createLemonadeRatio() {
        
        lemonateRatio = Double(lemons) / Double(iceCubes)
        println("Lemonade ratio: \(lemonateRatio)")
    }
}