//
//  ViewController.swift
//  MertKarahan
//
//  Created by Mert Karahan on 9.09.2022.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    private var registerModelList: [RegisterModel] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(.init(nibName: "MainScreenTableViewCell", bundle: nil), forCellReuseIdentifier: "MainScreenTableViewCell")
        
        setupTableView()
        navigationBarItems()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let registerVC = segue.destination as? RegistrationScreenViewController
        registerVC?.onTapSubmit = { model in
            self.registerModelList.append(model)
            self.tableView.reloadData()
        }
    }
}

//Configuration functions.
extension MainScreenViewController {
    
    private func navigationBarItems() {
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(image: .add, style: UIBarButtonItem.Style.done, target: self, action: #selector(addButtonClicked))
        
    }
    
    @objc func addButtonClicked(){
        performSegue(withIdentifier: "toRegistrationViewController", sender: nil)
    }
}

//TableView delegate and data source functions.
extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return registerModelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainScreenTableViewCell", for: indexPath) as! MainScreenTableViewCell
        cell.configure(registerInstance: registerModelList[indexPath.row])
        return cell
        
    }
}




