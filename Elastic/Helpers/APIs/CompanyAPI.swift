//
//  CompanyAPI.swift
//  Elastic
//
//  Created by Doan Phuc Hien on 12/5/18.
//  Copyright © 2018 HSG. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper


class CompanyAPI: NSObject {

    static let shared = CompanyAPI()
    private var manager: SessionManager
    
    private override init() {
        self.manager = Alamofire.SessionManager.default
    }
    
    func getCompanies(completion:@escaping ([Company]) -> Void, failure:@escaping (Int, String) -> Void) -> Void {
        
        let url: String = APIConstants.host + APIConstants.pathCompany
        self.manager.request(url).validate(statusCode: 200..<300).responseArray { (response: DataResponse<[Company]>) in

            switch response.result {
            case .success:
                let companies = response.result.value ?? []
                completion(companies)
            case .failure(let error):
                failure(0, "Error \(error)")
            }
        }
    }
}
