//
//  SearchPresenter.swift
//  iMusic
//
//  Created by nik on 19.01.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SearchPresentationLogic {
    func presentData(response: Search.Model.Response.ResponseType)
}

class SearchPresenter: SearchPresentationLogic {
    weak var viewController: SearchDisplayLogic?
    
    func presentData(response: Search.Model.Response.ResponseType) {
        switch response {
            
        case .some:
            print("presenter .some")
        case .presentTracks(let searchResults):
            let cells = searchResults?.results.map({ track in
                cellViewModel(from: track)
            }) ?? []
            
            let searchViewModel = SearchViewModel.init(cells: cells)
            print("presenter .presentTracks")
            viewController?.displayData(viewModel: .displayTracks(searchViewModel: searchViewModel))
        }
    }
    
    private func cellViewModel(from track: Track) -> SearchViewModel.Cell {
        SearchViewModel.Cell.init(iconUrlString: track.artworkUrl100,
                                  trackName: track.trackName,
                                  collectionName: track.collectionName ?? "",
                                  artistName: track.artistName,
                                  previewUrl: track.previewUrl)
    }
}
