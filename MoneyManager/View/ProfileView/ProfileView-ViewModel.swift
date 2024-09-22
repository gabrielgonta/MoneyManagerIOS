//
//  ProfileView-ViewModel.swift
//  MoneyManager
//
//  Created by Gabriel on 09/07/23.
//

import SwiftUI
import PhotosUI

extension ProfileView {
    @MainActor class ViewModel: ObservableObject {
        @Published var selectedPhotoData: Data?
        @Published var selectedPhoto: PhotosPickerItem?
        @Published var isPhotoSelected = false
    }
}
