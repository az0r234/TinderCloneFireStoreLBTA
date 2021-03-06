//
//  FirebaseRefactor.swift
//  TinderCloneFireStoreLBTA
//
//  Created by Alok Acharya on 5/4/20.
//  Copyright © 2020 Alok Acharya. All rights reserved.
//


import Firebase
import FirebaseFirestore
import FirebaseAuth

extension Firestore {
    func fetchCurrentUser(completion: @escaping (User?, Error?) -> ()) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        Firestore.firestore().collection("users").document(uid).getDocument { (snapshot, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            
            // fetched our user here
            guard let dictionary = snapshot?.data() else { return }

            let user = User(dictionary: dictionary)
            completion(user, nil)
        }
    }
}
