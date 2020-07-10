//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate
{
    func didUpdatePrice(price: String, currency: String)
    func didFailWithError(error: Error)
}

struct CoinManager
{
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC";
    let apiKey = "F868F3C8-EADD-4B9C-89AE-FF14D4FFBE1E";

    var delegate: CoinManagerDelegate?

    // Eg URL : https://rest.coinapi.io/v1/exchangerate/BTC/{convertCurrency}?apikey={apikey}
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"];

    func getCoinPrice(for currency: String)
    {

        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"

        if let url = URL(string: urlString)
        {

            let session = URLSession(configuration: .default)

            let task = session.dataTask(with: url)
            {
                (data, response, error) in
                if error != nil
                {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }

                if let safeData = data
                {
                    if let bitcoinPrice = self.parseJSON(safeData)
                    {
                        let priceString = String(format: "%.2f", bitcoinPrice)
                        self.delegate?.didUpdatePrice(price: priceString, currency: currency)
                    }
                }
            }
            task.resume()
        }
    }

    func parseJSON(_ data: Data) -> Double?
    {
        let decoder = JSONDecoder()

        do
        {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodedData.rate
            return lastPrice
        }
        catch
        {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
