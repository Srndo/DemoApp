//
//  Networking.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import Alamofire

class Networking {
    typealias WebserviceResponse = ([User]?, Error?) -> Void

    func fetch(_ url: URL, completition: @escaping WebserviceResponse) {
        Alamofire.request(url).validate().responseJSON { response in
            if let error = response.error {
                completition(nil, error)
                return
            }
            guard let data = response.data else {
                completition(nil, NSError(domain: "Coordinator", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data in response."]))
                return
            }
            if let user = try? JSONDecoder().decode(User.self, from: data) {
                completition([user], nil)
            } else if let users = try? JSONDecoder().decode([User].self, from: data) {
                completition(users, nil)
            } else {
                completition(nil,
                             NSError(domain: "Coordinator",
                                     code: 0,
                                     userInfo: [NSLocalizedDescriptionKey: "Cannot decode data from response."]))
            }
        }
    }
}
