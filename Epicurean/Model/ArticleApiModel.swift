//
//  ArticleAPIModel.swift
//  Epicurean
//
//  Created by Rodrigo Paschoaletto on 07/07/2021.
//

import Foundation

class ArticleApi: BaseAPI {
    let baseURL = URL(string: "http://192.168.15.21:5000")
    
    public func getArticles(result: @escaping (Result<[Article], APIServiceError>) -> Void) {
        let url = baseURL!.appendingPathComponent("articles")
        
        fetchResources(url: url, completion: result)
    }
    
    public func getTopcharts(result: @escaping (Result<[Article], APIServiceError>) -> Void) {
        let url = baseURL!.appendingPathComponent("articles/topcharts")
        
        fetchResources(url: url, completion: result)
    }
    
    public func getTodaysFeed(result: @escaping (Result<[Article], APIServiceError>) -> Void) {
        let url = baseURL!.appendingPathComponent("articles/today")
        
        fetchResources(url: url, completion: result)
    }
    
    public func getFood(result: @escaping (Result<[Article], APIServiceError>) -> Void) {
        let url = baseURL!.appendingPathComponent("articles/category/food")
        
        fetchResources(url: url, completion: result)
    }
    
    public func getWine(result: @escaping (Result<[Article], APIServiceError>) -> Void) {
        let url = baseURL!.appendingPathComponent("articles/category/wine")
        
        fetchResources(url: url, completion: result)
    }
    
    public func getLifestyle(result: @escaping (Result<[Article], APIServiceError>) -> Void) {
        let url = baseURL!.appendingPathComponent("articles/category/lifestyle")
        
        fetchResources(url: url, completion: result)
    }
}
