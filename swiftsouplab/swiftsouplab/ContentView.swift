//
//  ContentView.swift
//  swiftsouplab
//
//  Created by Samuel Owino on 16/12/2023.
//

import SwiftUI
import SwiftSoup

struct ContentView: View {
    
    @State var linkText: String = "No Text"
    @State var linkImage: Image? = nil
    
    var body: some View {
        VStack {
            linkImage?
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text(linkText)
        }
        .padding()
        .onAppear {
            fetchWebsitePreviewAndFavicon { previewString, previewImage in
                linkText = previewString
            }
            
            fetchFavicon(){ image in
                if let image {
                    linkImage = Image(uiImage: image)
                }
            }
        }
    }
    
    func fetchWebsitePreviewAndFavicon(completion: @escaping (String, Image?) -> Void) {
        print("fetchWebsitePreviewAndFavicon")
        let urlSession = URLSession.shared
        guard let url: URL = URL(string: "https://github.com/samuelowino") else {
            print("Error: invalid url")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        urlSession.dataTask(with: request){ data, response, error in
            if let error {
                print(error.localizedDescription)
            }
            
            if let response {
                print("response \(response)")
            }
            
            if let data {
                do {
                    if let htmlString = String(data: data, encoding: .utf8) {
                        // Use SwiftSoup to parse HTML and extract relevant information
                        let doc = try SwiftSoup.parse(htmlString)
                        let title = try doc.title()
                        let metaDescription = try doc.select("meta[name=description]").attr("content")
                        
                        let preview = "\(title)\n\n\(metaDescription)"
                        completion(preview, nil)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    func fetchFavicon(then: @escaping(UIImage?) -> ()){
        print("fetchFavicon...")
        let urlSession = URLSession.shared
        let urlRequest = URLRequest(url: URL(string: "https://github.com/favicon.ico")!)
        urlSession.dataTask(with: urlRequest) { data, response, error in
            if let error {
                print(error.localizedDescription)
            }
            
            if let response {
                print("fetch favicon response \(response)")
            }
            
            if let data {
                let image = UIImage(data: data)
                then(image)
            }
        }.resume()
    }
}

#Preview {
    ContentView()
}
