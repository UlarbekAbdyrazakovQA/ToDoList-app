//
//  TableViewController.swift
//  ToDoList
//
//  Created by Ularbek Abdyrazakov on 29.01.2021.
//
import RealmSwift
import UIKit

class TableViewController: UITableViewController,UISearchBarDelegate {
    
   private let realm = try! Realm()
   private var ToDoItems = [TaskList]()
    

    
    @IBAction func pushEditAction(_ sender: Any) {
        tableView.setEditing(!tableView.isEditing, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
            self.tableView.reloadData()

        }
        
    }
    

    @IBAction func pushAddAction(_ sender: Any) {
       let alertController =  UIAlertController(title: "Creat new item", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "New item name"
        }
        
        let alertAction2 = UIAlertAction(title: "create", style: .cancel) { [self] (alert) in
            
            if let newItems = alertController.textFields![0].text, !newItems.isEmpty {
                
                
                realm.beginWrite()
                let newItem = TaskList()
                newItem.name = newItems
                
                newItem.completed = false
               
                realm.add(newItem)
                try! realm.commitWrite()
                
                
            }
            
            
             
             
        }
        let alertAction1 = UIAlertAction(title: "cancel", style: .default) { (alert) in
           
            
        }
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        self.tableView.reloadData()
        present(alertController, animated: true, completion: nil)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ToDoItems = realm.objects(TaskList.self).map({ $0 })
        self.tableView.reloadData()
        
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.systemOrange
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ToDoItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let currentItem = ToDoItems[indexPath.row]
        cell.textLabel?.text = currentItem.name
        
        if currentItem.completed == true {
            cell.imageView?.image = #imageLiteral(resourceName: "check")
            }
        else{
            cell.imageView?.image = #imageLiteral(resourceName: "iconfinder_uncheck_4473001")
        }
        
        
        if tableView.isEditing{
            cell.textLabel?.alpha = 2
            cell.imageView?.alpha = 2

        }else{
            cell.textLabel?.alpha = 4
            cell.imageView?.alpha = 4
        }
        
        
        
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            let item = ToDoItems[indexPath.row]
            try! self.realm.write({
                self.realm.delete(item)
            })
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } else if editingStyle == .insert {}
    }
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
////            removeItem(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        let state = ToDoItems[indexPath.row]
        
        try!self.realm.write({
            state.completed = !state.completed
            
        })
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
        

    }

    
    // Override to support rearranging the table view.
    
//    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        if tableView.isEditing{
//            return .none
//        }
//        else{
//            return .delete
//        }
//    }
    
 

    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
   
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//
//        var arrayy = ToDoItems.values
//
//        }
}
    

