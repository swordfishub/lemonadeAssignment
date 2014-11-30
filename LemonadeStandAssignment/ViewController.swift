//
//  ViewController.swift
//  LemonadeStandAssignment
//
//  Created by iMac on 22/11/14.
//  Copyright (c) 2014 mrodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var daysOnActive = 0
    
    var money = 10
    
    let lemonPrice = 2
    let iceCubPrice = 1
    
    var lemonsInInventary = 0
    var iceCubesInInventary = 0
    
    var lemonsInLemonade = 0
    var iceCubesInLemonade = 0
    
    var dayLemonade:Lemonade?
    var dayWeather:Weather?
    var lemonadeCustomers:[Customer] = [Customer]()
    
    enum productEnum:String {
        case Lemon = "lemons"
        case IceCub = "ice cubes"
    }

    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var lemonsInInventaryLabel: UILabel!
    @IBOutlet weak var iceCubesInInventaryLabel: UILabel!
    @IBOutlet weak var lemonsForLemonadeLabel: UILabel!
    @IBOutlet weak var iceCubesForLemonadeLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var daysLabel: UILabel!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onBuyLemonClick(sender: UIButton){
        
        if(money >= lemonPrice){
            buyLemon()
            updateMoneyLabel()
            updateLemonsInInventaryLabel()
        }
        else {
            showNoMoneyAlert()
        }
    }
    
    @IBAction func onSellLemonClick(sender: UIButton) {
        
        if(lemonsInInventary>0){
            sellLemon()
            updateMoneyLabel()
            updateLemonsInInventaryLabel()
        }
        else{
            showNoProductsInInventary(productEnum.Lemon)
        }
    }
    
    @IBAction func onBuyIceCubClick(sender: UIButton) {
        
        if(money >= iceCubPrice){
            buyIceCube()
            updateMoneyLabel()
            updateIceCubesInInventaryLabel()
        }
        else {
            showNoMoneyAlert()
        }
    }
    
    @IBAction func onSellIceCubeClick(sender: UIButton) {
        
        if(iceCubesInInventary>0){
            sellIceCub()
            updateMoneyLabel()
            updateIceCubesInInventaryLabel()
        }
        else{
            showNoProductsInInventary(productEnum.IceCub)
        }
    
    }
    
    @IBAction func onAddLemonToLemonadeClick(sender: UIButton) {
        
        if(lemonsInInventary>0){
            addLemonToLemonade()
            updateLemonsInInventaryLabel()
            updateLemonsInLemonadeLabel()
        }
        else{
            showNoProductsInInventary(productEnum.Lemon)
        }
    }
    
    @IBAction func onRemoveLemonFromLemonadeClick(sender: UIButton) {
        
        if(lemonsInLemonade>0){
            removeLemonFromLemonade()
            updateLemonsInInventaryLabel()
            updateLemonsInLemonadeLabel()
        }
        else{
            showNoProductsInLemonade(productEnum.Lemon)
        }
    }
    
    @IBAction func onAddIceCubToLemonadeClick(sender: UIButton) {
        
        if(iceCubesInInventary>0){
            addIceCubToLemonade()
            updateIceCubesInInventaryLabel()
            updateIceCubesInLemonadeLabel()
        }
        else{
            showNoProductsInInventary(productEnum.IceCub)
        }
    }
    
    @IBAction func onRemoveIceCubFromLemonadeClick(sender: UIButton) {
        
        if(iceCubesInLemonade>0){
            removeIceCubFromLemonade()
            updateIceCubesInInventaryLabel()
            updateIceCubesInLemonadeLabel()
        }
        else{
            showNoProductsInLemonade(productEnum.IceCub)
        }
    }
    
    @IBAction func startDayClick(sender: UIButton) {
        
        if(lemonsInLemonade>0 && iceCubesInLemonade>0){
            
            println("")
            println("Start day")
            println("")
            
            dayLemonade = Lemonade(lemons: lemonsInLemonade, iceCubes: iceCubesInLemonade)
            
            dayWeather = Weather()
            
            createRandomCustomers(dayWeather!.obtainWeatherType())
            
            showWeatherImage(dayWeather!.obtainWeatherImage())
            
            checkRevenius()
            
            finishDay()
            
            throwLemonade()
            
        }
        else{
            showAlertWithText(message: "You don't have enought ingredients to create a lemonade")
        }
        
    }
    
    //private methods
    
    func buyLemon(){
        money -= lemonPrice
        lemonsInInventary++
    }
    
    func buyIceCube(){
        money -= iceCubPrice
        iceCubesInInventary++
    }
    
    func sellLemon(){
        money += lemonPrice
        lemonsInInventary--
    }
    
    func sellIceCub(){
        money += iceCubPrice
        iceCubesInInventary--
    }
    
    func updateMoneyLabel(){
        moneyLabel.text = "$\(money)"
    }
    
    func addLemonToLemonade(){
        lemonsInInventary--
        lemonsInLemonade++
    }
    
    func addIceCubToLemonade(){
        iceCubesInInventary--
        iceCubesInLemonade++
    }
    
    func removeLemonFromLemonade(){
        lemonsInLemonade--
        lemonsInInventary++
    }
    
    func removeIceCubFromLemonade(){
        iceCubesInLemonade--
        iceCubesInInventary++
    }
    
    func updateLemonsInInventaryLabel(){
        lemonsInInventaryLabel.text = "\(lemonsInInventary) Lemons"
    }
    
    func updateIceCubesInInventaryLabel(){
        iceCubesInInventaryLabel.text = "\(iceCubesInInventary) Ice cubes"
    }
    
    func updateLemonsInLemonadeLabel(){
        lemonsForLemonadeLabel.text = "\(lemonsInLemonade) Lemons"
    }
    
    func updateIceCubesInLemonadeLabel(){
        iceCubesForLemonadeLabel.text = "\(iceCubesInLemonade) Ice cubes"
    }
    
    func updateDaysOnActiveLabel(){
        daysLabel.text = "\(daysOnActive) days"
    }
    
    func showAlertWithText (header:String = "Warning", message : String) {
        
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func showNoMoneyAlert(){
        showAlertWithText(message: "You have not enough money to buy it!")
    }
    
    func showNoProductsInInventary(product: productEnum){
        showAlertWithText(message: "You have no \(product.rawValue) in your inventary!")
    }
    
    func showNoProductsInLemonade(product: productEnum){
        showAlertWithText(message: "You have no \(product.rawValue) in your inventary!")
    }
    
    func createRandomCustomers(currentWeather:Weather.weatherType){
        
        var numberOfLemonadeCustomers = Int(arc4random_uniform(UInt32(10))) + 1
        
        println("Number of customers before: \(numberOfLemonadeCustomers)")
        
        numberOfLemonadeCustomers = updateCustomersDependOnWeather(numberOfLemonadeCustomers, weatherType: currentWeather)
            
        println("Number of customers after: \(numberOfLemonadeCustomers)")
        
        createCustomers(numberOfLemonadeCustomers)
    }
    
    func createCustomers(numberOfCustomers:Int){
        
        for (var i=0; i < numberOfCustomers; i++){
            let customer = Customer()
            lemonadeCustomers.append(customer)
        }
    }
    
    func updateCustomersDependOnWeather(var numberOfCustomers:Int, weatherType: Weather.weatherType) -> Int{
        
        if(weatherType == Weather.weatherType.COLD){
            numberOfCustomers -= 3
        }
        else if(weatherType == Weather.weatherType.WARM){
            numberOfCustomers += 4
        }
        
        if(numberOfCustomers<0){
            numberOfCustomers = 0
        }
        
        return numberOfCustomers
    }
    
    
    
    func showWeatherImage(image:UIImage){
        
        self.weatherImage.image = image
    }
    
    
    func checkRevenius(){
        
        var matches = 0
        
        for (var i=0; i < lemonadeCustomers.count; i++){
            
            var lemonadeCustomer = lemonadeCustomers[i]
            if(lemonadeCustomer.getCustomersTastePreference() == dayLemonade?.getLemonadeTaste()){
                println("Paid!")
                matches++
            }
            else{
                println("No match. No revenue")
            }
           
        }
        
        money += matches
        updateMoneyLabel()
        
        
        if(money>2){
            showAlertWithText(header:"Congratulation!", message: "At the end of the day \(matches) of \(lemonadeCustomers.count) customers like your lemonade. You earn $\(matches) and now you have $\(money)")
            
            updateDaysOnActive()
            
        }
        else{
            showAlertWithText(header:"You were \(daysOnActive) days on active", message: "At the end of the day \(matches) of \(lemonadeCustomers.count) customers like your lemonade. You earn $\(matches) and now you have $\(money), but it is not enough to mix a new lemonade for tomorrow")
            
            restartGame()
        }
        
        
    }
    
    func finishDay(){
        
        dayLemonade = nil
        lemonadeCustomers.removeAll(keepCapacity: false)
        
        throwLemonade()
        
    }
    
    func throwLemonade(){
        
        lemonsInLemonade = 0
        iceCubesInLemonade = 0
        
        updateLemonsInLemonadeLabel()
        updateIceCubesInLemonadeLabel()
    }
    
    func updateDaysOnActive(){
        
        daysOnActive++
        updateDaysOnActiveLabel()
    }
    
    func restartGame(){
        
        daysOnActive = 0
        updateDaysOnActiveLabel()
        
        money = 10
        updateMoneyLabel()
    }
    
}

