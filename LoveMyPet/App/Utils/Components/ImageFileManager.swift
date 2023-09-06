
import SwiftUI

class ImageFileManager: ObservableObject {
    @Published var images: [UIImage] = []
    init() {
        loadImagesFromDocumentsDirectory()
    }
    func loadImagesFromDocumentsDirectory() {
        let fileManager = FileManager.default
        guard let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return
        }
        do {
            let fileURLs = try fileManager.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            for fileURL in fileURLs {
                if let data = try? Data(contentsOf: fileURL), let image = UIImage(data: data) {
                    images.append(image)
                }
            }
        } catch {
            print("Error while enumerating files from documents directory: \(error.localizedDescription)")
        }
        func saveImage(image: UIImage) -> Bool {
            guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
                return false
            }
            guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
                return false
            }
            do {
                try data.write(to: directory.appendingPathComponent("fileName.png")!)
                return true
            } catch {
                print(error.localizedDescription)
                return false
            }
        }
    }
}
