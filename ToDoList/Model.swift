//
//  Model.swift
//  ToDoList
//
//  Created by Ularbek Abdyrazakov on 29.01.2021.
//
import RealmSwift
import Foundation


 
 class TaskList: Object{
 
    @objc dynamic  var name = ""
    @objc dynamic var completed = false
 }
 

 
//class DBManager {
//
//    var database: Realm!
//    static let sharedInstance = DBManager()
//
//
//    private init() {
//        database = try! Realm()
//    }
//
//    func getDataFromDB() -> Results<TaskList> {
//        let results: Results<TaskList> = database.objects(TaskList.self)
//        return results
//    }
//
//    func addData(object: TaskList)   {
//        try! database.write {
//            database.add(object)
//            print("Added new object")
//        }
//    }
//
//    func deleteFromDb(object: TaskList)   {
//        try!   database.write {
//            database.delete(object)
//        }
//    }
//
//    func completedFromDB(object: TaskList) -> Bool {
//        try! database.write {
//            object.completed = !(object.completed)
//            return object.completed
//        }
//    }
//}



    
//var ToDoItems:[[String:Any]] {
//    set{
//
//        UserDefaults.standard.set(newValue, forKey: "ToDoDataKey")
//        UserDefaults.standard.synchronize()
//    }
//    get{
//        if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String:Any]]{
//            return array
//        }
//        else{
//            return  []
//        }
//    }
//}


//func addItem(nameItem: String,isCompleted: Bool = false){
//    ToDoItems.append(["Name":nameItem , "isCompleted": isCompleted])
//
//}

/*
 
    fethcing
 
    func render(){
    
 }
 
    Adding
 realm.beginWrite()
 realm.add(task.)
 try!realm.commitWrite()
*/


//func removeItem(at index: Int){
//    ToDoItems.remove(at: index)
//
//}
//
//func changeState(at item: Int) -> Bool{
//
//    ToDoItems[item]["isCompleted"] = !(ToDoItems[item]["isCompleted"] as! Bool)
//
//
//    return ToDoItems[item]["isCompleted"] as! Bool
//}
//
//
//
//func moveItem(fromIndex: Int, toIndex: Int){
//
//    let from = ToDoItems[fromIndex]
//    ToDoItems.remove(at: fromIndex)
//    ToDoItems.insert(from, at: toIndex)
//
//}
