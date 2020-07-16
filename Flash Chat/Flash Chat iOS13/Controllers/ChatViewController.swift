//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController
{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!

    let db = Firestore.firestore();

    var messages : [Message] =
    [
        Message(sender: "i@i.com", body: "Hey!"),
        Message(sender: "e@e.com", body: "Hi! Whatsup?"),
        Message(sender: "i@i.com", body: "hbsdfhbisdhbfihbsidhbi ibiwefihb b ihbwefihbibiwefb ibibibfibsdfl bhhbwihbwefi hbebihbwefi hb bihbwefhbihbwef bbihbwefihbwef ib")
    ]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        messageTextfield.layer.cornerRadius = 30;
        title = "⚡️FlashChat";
        tableView.dataSource = self;
        navigationItem.hidesBackButton = true;

        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier);
    }
    
    @IBAction func sendPressed(_ sender: UIButton)
    {
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email
        {
            db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.senderField : messageSender, K.FStore.bodyField : messageBody])
            {
                (error) in

                if let e = error
                {
                    print("There was an error saving data to firestore, \(e)");
                }
                else
                {
                    print("Succesfully saved data");
                }
            }
        }
    }

    @IBAction func logoutPressed(_ sender: UIBarButtonItem)
    {
        let firebaseAuth = Auth.auth()
        do
        {
            try firebaseAuth.signOut();
            navigationController?.popToRootViewController(animated: true);
        }
        catch let signOutError as NSError
        {
            print ("Error signing out: %@", signOutError)
        }
    }
}

extension ChatViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return messages.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell;
        cell.label.text = messages[indexPath.row].body;
        return cell;
    }
}
