//
//  CryptoViewModel.swift
//  CryptoCrazy
//
//  Created by kadir on 7.01.2023.
//

import Foundation

struct CryptoListViewModel {
    let cryptoList: [CryptoCurrency]
    
    

    
}



extension CryptoListViewModel {
    func countList() -> Int {
        return self.cryptoList.count
    }
    
    func cryptoAtIndex(index: Int) -> CryptoCurrency {
     return cryptoList[index]
    }
}



struct CryptoViewModel {
    let crypto: CryptoCurrency
}
