//
//  DatabaseUtils.swift
//  ComixCreator
//
//  Created by Svetoslav Dimov on 1.03.23.
//
import SwiftUI
import Foundation

class DatabaseUtils {
        
    static func load<T: Decodable>(_ filename: String) -> T {
        let data: Data

        guard let file = Bundle.main.url(forResource: filename, withExtension: "json")
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
    
    static func write(_ comix: ComixModel) {
        do{
            var comixes: [ComixModel] = load("comixes")
            var isPresent: Int = -1
            for i in 0...comixes.count - 1 {
                if comixes[i].overview == comix.overview {
                    isPresent = i
                }
            }
            if isPresent != -1 {
                comixes[isPresent] = comix
            } else {
                comixes.append(comix)
            }
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let jsonData = try encoder.encode(comixes)
            try jsonData.write(to: Bundle.main.url(forResource: "comixes", withExtension: "json")!)
        } catch {
            print(error)
        }
    }
    
    
    static func saveImage(image: UIImage, name: String) -> String? {
        guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
            return nil
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return nil
        }
        do {
            let path = directory.appendingPathComponent("\(name).png")!
            if FileManager.default.fileExists(atPath: path.absoluteString) {
                do
                {
                    try FileManager.default.removeItem(atPath: path.absoluteString)
                }
                catch
                {
                    print(error)
                }
            }
            try data.write(to: path)
            return path.absoluteString
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    static func getSavedImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            let url = URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path
            print(url)
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
    
    static func loadPlusButtons() {
        _ = saveImage(image: UIImage(named: "PlusButton")!, name: "plus_button")
        _ = saveImage(image: UIImage(named: "PlusButton2")!, name: "plus_button2")
        _ = saveImage(image: UIImage(named: "PlusButton3")!, name: "plus_button3")
        _ = saveImage(image: UIImage(named: "PlusButton4")!, name: "plus_button4")
        _ = saveImage(image: UIImage(named: "PlusButton5")!, name: "plus_button5")
        _ = saveImage(image: UIImage(named: "PlusButton6")!, name: "plus_button6")
        _ = saveImage(image: UIImage(named: "PlusButton7")!, name: "plus_button7")
        _ = saveImage(image: UIImage(named: "PlusButton8")!, name: "plus_button8")
        _ = saveImage(image: UIImage(named: "PlusButton9")!, name: "plus_button9")
        _ = saveImage(image: UIImage(named: "PlusButton10")!, name: "plus_button10")
        _ = saveImage(image: UIImage(named: "PlusButton11")!, name: "plus_button11")
    }
}
