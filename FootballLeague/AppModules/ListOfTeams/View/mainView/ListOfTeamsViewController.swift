//
//  ListOfTeamsViewController.swift
//  FootballLeague
//
//  Created by Adam on 10/16/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit


protocol IListOfTeamsViewController: class {
	var router: IListOfTeamsRouter? { get set }
    func showTeams(teams: ListOfTeamsModel.Response)
    func showTeams(teams: RealmListOfTeams)
}

class ListOfTeamsViewController: UIViewController {
    
    // MARK: - Variables
	var interactor: IListOfTeamsInteractor?
	var router: IListOfTeamsRouter?
    var currentPage: Int = 0
    var count = 6
    var isLoadingList : Bool = false
    var isOFFLine = false
    var teamsArr: [ListOfTeamsModel.Team] = []
    var realmLeagues: RealmListOfTeams?
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    // MARK: - Life cycle
	override func viewDidLoad() {
        super.viewDidLoad()
		setUpUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        getTeam()
    }
    
}

extension ListOfTeamsViewController: IListOfTeamsViewController {
    func showTeams(teams: RealmListOfTeams) {
        isOFFLine = true
        self.realmLeagues = teams
        getListFromArray(currentPage)
    }
    
    func showTeams(teams: ListOfTeamsModel.Response) {
        isOFFLine = false
        guard let teamsList = teams.teams else {
            return
        }
        interactor?.addListOfTeamsToCash(teams: teams)
        for team in teamsList{
            teamsArr.append(team)
        }
        getListFromArray(currentPage)
    }
    func getListFromArray(_ pageNumber: Int){
        currentPage += 1
         self.isLoadingList = false
        tableView.delegate = self
        tableView.dataSource = self
         self.tableView.reloadData()
        indicator.stopAnimating()
     }
    fileprivate func openURl(url: String) {
        if let url = URL(string: url) {
            UIApplication.shared.open(url)
        }
    }
  
    func getTeam(){
        interactor?.getTeams()
    }
}

extension ListOfTeamsViewController {
    func setUpUI(){
        setUpNavigation()
        registerTableCell()
    }
    func setUpNavigation(){
        navigationItem.title = "List of teams"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = .black
    }
    func registerTableCell() {
        let cell = UINib(nibName: "TeamTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "TeamTableViewCell")
    }
  
}
// MARK: - TableView Delegate Methods
extension ListOfTeamsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        count = count * currentPage
        if count > 20 {
            if isOFFLine {
                return 20
            }
            else{
                return teamsArr.count
            }
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamTableViewCell", for: indexPath) as! TeamTableViewCell
        
        if isOFFLine {
            let team = self.realmLeagues?.teams[indexPath.row]
            cell.teamName.text = team?.name
            cell.clubColor.text = team?.clubColors
            cell.teamWESite.setTitle(team?.website, for: .normal)
            cell.venu.text = team?.venue
            cell.teamWESite.tag = indexPath.row
            cell.teamWESite.addTarget(self, action: #selector(showWebsSite), for: .touchUpInside)
        }
        else{
            let team = teamsArr[indexPath.row]
            cell.teamName.text = team.name
            cell.clubColor.text = team.clubColors
            cell.teamWESite.setTitle(team.website, for: .normal)
            cell.venu.text = team.venue
            cell.teamWESite.tag = indexPath.row
            cell.teamWESite.addTarget(self, action: #selector(showWebsSite), for: .touchUpInside)
        }
       
        return cell
    }
    @objc func showWebsSite(sender: UIButton) {
        if !isOFFLine {
            guard let url = self.teamsArr[sender.tag].website else {
                return
            }
            self.openURl(url: url)
        }
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.size.height / 6
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !isOFFLine {
            guard let teamID = teamsArr[indexPath.row].id else {
                return
            }
            var parameters = [String: Any]()
            parameters["team_id"] = teamID
            router?.navigateToTeamDetails(parameters: parameters)
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height ) && !isLoadingList){
            self.isLoadingList = true
            indicator.startAnimating()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.getListFromArray(self.currentPage)
            }
        }
    }
    
    
}
