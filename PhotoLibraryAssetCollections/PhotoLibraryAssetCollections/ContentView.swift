//
//  ContentView.swift
//  PhotoLibraryAssetCollections
//
//  Created by Samuel Owino on 06/02/2024.
//
import Photos
import SwiftUI
import UIKit
struct ContentView: View {
    @State var images: [UIImage] = []
    var body: some View {
        ScrollView {
            VStack {
                Text("Recent Photos")
                ForEach(images, id: \.self) { image in
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                Spacer()
            }
            .padding()
        }
        .onAppear { fetchPhotosCollection() }
    }
    private func fetchPhotosCollection(){
        print("fetchPhotosCollection")
        let fetchOptions: PHFetchOptions = PHFetchOptions()
        fetchOptions.fetchLimit = 1
        let collection: PHFetchResult<PHAssetCollection> = PHAssetCollection
            .fetchAssetCollections(with: PHAssetCollectionType.smartAlbum,
                                   subtype: PHAssetCollectionSubtype.smartAlbumFavorites,
                                   options: fetchOptions)
        print("fetchPhotosCollection: result \(collection.count)")
        dump(collection)
        guard let collectionResult = collection.firstObject else { return }
        let assetFetchOptions: PHFetchOptions = PHFetchOptions()
        assetFetchOptions.fetchLimit = 3
        assetFetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate",
                                                         ascending: false)]
        let assets: PHFetchResult<PHAsset> = PHAsset
            .fetchAssets(in: collectionResult, options: assetFetchOptions)
        assets.enumerateObjects { (asset, index, stop) in
            if asset.mediaType == .image {
                loadImage(asset: asset)
            }
        }
    }
    private func loadImage(asset: PHAsset) {
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = false
        requestOptions.resizeMode = .exact
        let imageManager = PHImageManager.default()
        imageManager.requestImage(for: asset,
                                  targetSize: PHImageManagerMaximumSize,
                                  contentMode: .default,
                                  options: requestOptions) { image, _ in
            DispatchQueue.main.async {
                guard let image else { return }
                self.images.append(image)
            }
        }
    }
}
#Preview { ContentView() }
