//
//  NetworkService.swift
//  MyNews
//
//  Created by Aliaksandr Pustahvar on 28.04.23.
//

import Alamofire
import SwiftUI

final class NetworkService {
    
    func fetchData() async -> News? {
        let urlString = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=1dee312ed09140d4a116dea413dae07c"
        guard let url = URL(string: urlString) else {
            print("Wrong URL")
            return nil
        }
        return try? await AF.request(url).serializingDecodable(News.self).value
    }
}
