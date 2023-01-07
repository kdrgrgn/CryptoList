//
//  ViewController.swift
//  CryptoCrazy
//
//  Created by kadir on 7.01.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var colorArray = [UIColor]()

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.countList()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for:  indexPath) as! CryptoTableViewCell
        let crypto = self.cryptoListViewModel.cryptoAtIndex(index: indexPath.row)
        
        cell.price.text = crypto.price
        cell.currency.text = crypto.currency
        
        cell.backgroundColor = colorArray[indexPath.row % 6]

        return cell
    }
    
  
    private var cryptoListViewModel: CryptoListViewModel!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.colorArray = [
             UIColor(red: 70/255, green: 57/225, blue: 204/225, alpha: 1.0),
             UIColor(red: 14/255, green: 147/225, blue: 14/225, alpha: 1.0),
             UIColor(red: 104/255, green: 57/225, blue: 54/225, alpha: 1.0),
             UIColor(red: 104/255, green: 127/225, blue: 64/225, alpha: 1.0),
             UIColor(red: 114/255, green: 57/225, blue: 204/225, alpha: 1.0),
             UIColor(red: 154/255, green: 67/225, blue: 224/225, alpha: 1.0)]
        getData()
        // Do any additional setup after loading the view.
    }
    
    
    func getData(){
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        NetworkService().downloadCurrencies(url: url) { currencyList in
            if let crptos = currencyList {
                self.cryptoListViewModel = CryptoListViewModel(cryptoList: crptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    


}

