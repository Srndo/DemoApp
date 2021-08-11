//
//  WeatherHelper.swift
//  DemoApp
//
//  Created by Simon Sestak on 10/08/2021.
//

import UIKit
import PromiseKit

class WeatherHelper {
    func getWeather(atLatitude latitude: Double, longitude: Double) -> Promise<WeatherModel> {
        // swiftlint:disable:next line_length
        let urlString = "https://api.openweathermap.org/data/2.5/weather?" + "lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
        let url = URL(string: urlString)!
        return firstly {
            URLSession.shared.dataTask(.promise, with: url)
        }.compactMap {
            return try JSONDecoder().decode(WeatherModel.self, from: $0.data)
        }
    }

    func getIcon(named iconName: String) -> Promise<UIImage> {
        return Promise<UIImage> {
            getFile(named: iconName, completion: $0.resolve)
        }
        .recover { _ in
            self.getIconFromNetwork(named: iconName)
        }
    }

    func getIconFromNetwork(named iconName: String) -> Promise<UIImage> {
        let urlString = "https://openweathermap.org/img/w/\(iconName).png"
        let url = URL(string: urlString)!

        return firstly {
            URLSession.shared.dataTask(.promise, with: url)
        }
        .then(on: DispatchQueue.global(qos: .background)) { urlResponse in
            return Promise {
                self.saveFile(named: iconName, data: urlResponse.data, completion: $0.resolve)
            }
            .then(on: DispatchQueue.global(qos: .background)) {
                return Promise.value(UIImage(data: urlResponse.data)!)
            }
        }
    }

    private func saveFile(named: String, data: Data, completion: @escaping (Error?) -> Void) {
        // swiftlint:disable:next line_length
        guard let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent(named+".png") else { return }
        DispatchQueue.global(qos: .background).async {
            do {
                try data.write(to: path)
                print("Saved image to: " + path.absoluteString)
                completion(nil)
            } catch {
                completion(error)
            }
        }
    }

    private func getFile(named: String, completion: @escaping (UIImage?, Error?) -> Void) {
        DispatchQueue.global(qos: .background).async {
            // swiftlint:disable:next line_length
            if let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent(named+".png"),
               let data = try? Data(contentsOf: path),
               let image = UIImage(data: data) {
                DispatchQueue.main.async { completion(image, nil) }
            } else {
                let error = NSError(domain: "DemoApp",
                                    code: 0,
                                    userInfo: [NSLocalizedDescriptionKey: "Image file '\(named)' not found."])
                DispatchQueue.main.async { completion(nil, error) }
            }
        }
    }
}
