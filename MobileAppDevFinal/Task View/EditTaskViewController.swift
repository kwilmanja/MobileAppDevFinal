////
////  EditTaskViewController.swift
////  MobileAppDevFinal
////
////  Created by Joph Kwilman on 12/6/23.
////
//
//import UIKit
//import FirebaseFirestore
//import FirebaseAuth
//import PhotosUI
//
//class EditTaskViewController: UIViewController {
//
//    var currentUser:FirebaseAuth.User!
//
//    let addTaskScreen = AddTaskView()
//
//    let database = Firestore.firestore()
//
//    var groups: [Group]!
//
//    var selectedGroup: Group?
//    var pickedImage:UIImage?
//
//    override func loadView() {
//        view = addTaskScreen
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "New Task"
//
////        self.populateGroups()
//
//        addTaskScreen.buttonPhoto.menu = getMenuImage()
//
//        self.addTaskScreen.buttonSelectGroup.menu = self.getMenuTypes()
//
//        if let unwrappedSelectedGroup = self.selectedGroup {
//            self.addTaskScreen.buttonSelectGroup.setTitle(unwrappedSelectedGroup.name, for: .normal)
//        } else{
//            self.addTaskScreen.buttonSelectGroup.setTitle("Select Group", for: .normal)
//        }
//
//        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveTask))
//        navigationItem.rightBarButtonItem = saveButton
//
//        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
//        view.addGestureRecognizer(tapRecognizer)
//
//    }
//
//    @objc func hideKeyboardOnTap(){
//        //MARK: removing the keyboard from screen...
//        view.endEditing(true)
//    }
//
//
//    func getMenuImage() -> UIMenu{
//        let menuItems = [
//            UIAction(title: "Camera",handler: {(_) in
//                self.pickUsingCamera()
//            }),
//            UIAction(title: "Gallery",handler: {(_) in
//                self.pickPhotoFromGallery()
//            })
//        ]
//
//        return UIMenu(title: "Select source", children: menuItems)
//    }
//
//    //MARK: take Photo using Camera...
//    func pickUsingCamera(){
//        let cameraController = UIImagePickerController()
//        cameraController.sourceType = .camera
//        cameraController.allowsEditing = true
//        cameraController.delegate = self
//        present(cameraController, animated: true)
//    }
//
//    //MARK: pick a photo from the gallery
//    func pickPhotoFromGallery(){
//        var configuration = PHPickerConfiguration()
//        configuration.filter = PHPickerFilter.any(of: [.images])
//        configuration.selectionLimit = 1
//
//        let photoPicker = PHPickerViewController(configuration: configuration)
//
//        photoPicker.delegate = self
//        present(photoPicker, animated: true, completion: nil)
//    }
//
//
//    func getMenuTypes() -> UIMenu{
//        var menuItems = [UIAction]()
//
//        for g in self.groups{
//            let menuItem = UIAction(title: g.name, handler: {(_) in
//                                self.selectedGroup = g
//                self.addTaskScreen.buttonSelectGroup.setTitle(self.selectedGroup!.name, for: .normal)
//                            })
//            menuItems.append(menuItem)
//        }
//        return UIMenu(title: "Select type", children: menuItems)
//    }
//
//
//}
//
//
//extension AddTaskViewController:PHPickerViewControllerDelegate{
//    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
//        dismiss(animated: true)
//
//        print(results)
//
//        let itemprovider = results.map(\.itemProvider)
//
//        for item in itemprovider{
//            if item.canLoadObject(ofClass: UIImage.self){
//                item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
//                    DispatchQueue.main.async{
//                        if let uwImage = image as? UIImage{
//                            self.addTaskScreen.buttonPhoto.setImage(
//                                uwImage.withRenderingMode(.alwaysOriginal),
//                                for: .normal
//                            )
//                            self.pickedImage = uwImage
//                        }
//                    }
//                })
//            }
//        }
//    }
//}
//
//extension AddTaskViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        picker.dismiss(animated: true)
//
//        if let image = info[.editedImage] as? UIImage{
//            self.addTaskScreen.buttonPhoto.setImage(
//                image.withRenderingMode(.alwaysOriginal),
//                for: .normal
//            )
//            self.pickedImage = image
//        }else{
//            // Do your thing for No image loaded...
//        }
//    }
//}
