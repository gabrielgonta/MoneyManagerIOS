//
//  ProfileView.swift
//  MoneyManager
//
//  Created by Gabriel on 02/07/23.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @StateObject private var viewModel = ViewModel()
    @EnvironmentObject var dataController: DataController
    @Binding var permanentCancellation: Bool
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Form {
            VStack {
                VStack {
                    if (dataController.userData.user.picture != nil) {
                        let uiImage = UIImage(data: dataController.userData.user.picture!)
                        Image(uiImage: uiImage!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 75, height: 75)
                            .clipShape(Capsule())
                            .overlay(Circle().stroke(colorScheme == .light ? Color.black : Color.white, lineWidth: 1))
                    } else {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 75, height: 75)
                    }
                }
                .accessibilityElement()
                .accessibilityLabel("Your profile picture")
                
                VStack {
                    PhotosPicker("Select photo", selection: $viewModel.selectedPhoto)
                        .font(.caption)
                        .padding()
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top)
            .listRowSeparator(.hidden)
            .accessibilityLabel("Press this button for change your profile picture")
            
            Section {
                TextField("Name", text: $dataController.userData.user.name)
                TextField("Last Name", text: $dataController.userData.user.lastName)
            } header: {
                Text("Basic Info")
            }
            Section {
                TextField("Job", text: $dataController.userData.user.job)
                TextField("Country", text: $dataController.userData.user.country)
            } header: {
                Text("Additional Info")
            }
            Section {
                Toggle("Complete Deletion", isOn: $permanentCancellation)
            } header: {
                Text("Delete options")
            } footer: {
                Text("This option, when activated, can completely delete a transaction from history (it will re-add or re-subtract its value). You only need to toggle the switch, it's not necessary to press Save.")
            }
        }
        .toolbar {
            Button {
                dataController.saveUserInfo()
                dismiss()
            } label: {
                Text("Save")
            }
        }
        .navigationTitle("Profile")
        .onChange(of: viewModel.selectedPhoto) { newPhoto in
            Task {
                if let data = try? await newPhoto?.loadTransferable(type: Data.self) {
                    viewModel.selectedPhotoData = data
                    dataController.userData.user.picture = viewModel.selectedPhotoData
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationStack {
                ProfileView(permanentCancellation: .constant(true))
            }
            ProfileView(permanentCancellation: .constant(false))
                .preferredColorScheme(.dark)
        }
        .environmentObject(DataController())
    }
}
