//
//  ViewController.swift
//  Ted Talk
//
//  Created by Gonzalo Perretti on 4/6/21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var picker: UIPickerView!
    
    //MARK: - Properties
    var isSearchBarEmpty: Bool {
        return searchBar.text?.isEmpty ?? true
    }
    
    var manager: Manager = TalksManager()
    let filters = ["Any", "Event", "Speaker", "Title", "Name"]
    
    var tedTalks: [Talk] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTableView()
    }
    
    func loadTableView(){
        tableView.isHidden = true
        spinner.startAnimating()
        manager.getTedTalk() { [weak self] talks in
            self?.spinner.stopAnimating()
            self?.tableView.isHidden = false
            self?.tedTalks = talks
        }
    }
    
//    func setUP(){
//        
//    }
    
//    func updateData(_ talks: [Talk]) {
//        tedTalks = talks
//        tableView.reloadData()
//    }

}

//MARK: -Table View
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tedTalks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let talk = tedTalks[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TedTalkTableViewCell else {
            print("Error at get reusable Cell")
            return UITableViewCell()
        }
        let element = TedTalkTableViewCellModel(talk: talk)
        cell.setUp(with: element)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue"{
            guard let indexPath = self.tableView.indexPathForSelectedRow else {
                return
            }
            let tedTalkDetailView = segue.destination as? TedTalkDetailView
            let talk = tedTalks[indexPath.row]
            tedTalkDetailView!.talk = TedTalkDetailViewModel(talk: talk)
            self.tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
}

//MARK: -Search Bar
extension ViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        tedTalks = manager.getFilteredTalks(text: searchText, picker: filters[picker.selectedRow(inComponent: 0)])
    }
    
}

//MARK: -Piker View
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return filters.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return filters[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if !isSearchBarEmpty {
            tedTalks = manager.getFilteredTalks(text: searchBar.text ?? "", picker: filters[row])
        }
    }

}
