//
//  LocalStorage.swift
//  busbudchallenge
//
//  Created by Felipe Rolvar on 1/11/20.
//

import Foundation

enum UserDefaultsKeys: String {
    case firstRun
}

class LocalStorage {
    private let standart = UserDefaults.standard
    
    static let shared = LocalStorage()
    
    private init() {}
    
    @discardableResult
    func save<T: Encodable>(_ value: T, for key: UserDefaultsKeys) -> Bool {
        do {
            let encoded = try JSONEncoder().encode(value)
            standart.set(encoded, forKey: key.rawValue)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    func getValue<T: Decodable>(for key: UserDefaultsKeys) -> T? {
        do {
            let data = standart.data(forKey: key.rawValue)
            if let data = data {
                return try JSONDecoder().decode(T.self, from: data)
            }
            return nil
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func removeValue(for key: UserDefaultsKeys) {
        standart.removeObject(forKey: key.rawValue)
    }
    
    func fileExists(with key: UserDefaultsKeys) -> Bool {
        return standart.object(forKey: key.rawValue) != nil
    }
}
