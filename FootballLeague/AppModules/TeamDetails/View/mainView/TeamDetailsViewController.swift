//
//  TeamDetailsViewController.swift
//  FootballLeague
//
//  Created by Adam on 10/16/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol ITeamDetailsViewController: class {
    var router: ITeamDetailsRouter? { get set }
    func showTeamDetails(team: TeamDetailsModel.Response)
}

class TeamDetailsViewController: UIViewController {
    // MARK: - Variables
    var interactor: ITeamDetailsInteractor?
    var router: ITeamDetailsRouter?
    lazy var back: UIBarButtonItem = {
        return UIBarButtonItem(title: "⬅︎", style: .done, target: self, action: #selector(backAction))
    }()
    var team: TeamDetailsModel.Response?
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var shortname: UILabel!
    @IBOutlet weak var tla: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var founded: UILabel!
    @IBOutlet weak var clubcolor: UILabel!
    @IBOutlet weak var venue: UILabel!
    @IBOutlet weak var phone: UIButton!
    @IBOutlet weak var webSite: UIButton!
    @IBOutlet weak var crestUrl: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        getTeamDetails()
    }

    // MARK: - Actions
    @IBAction func goTOCrestURL(_ sender: UIButton) {
        guard let url = team?.crestURL else {
            return
        }
        OpenURl(url: url)
    }
    @IBAction func makeCall(_ sender: UIButton) {
        guard let phone = team?.phone else {
            return
        }
        guard let number = URL(string: phone) else { return }
        UIApplication.shared.open(number)
    }
    @IBAction func goToWEbSIte(_ sender: UIButton) {
        guard let url = team?.website else {
            return
        }
        OpenURl(url: url)
    }
   
    @objc func backAction() {
        self.dismiss()
    }
}

extension TeamDetailsViewController: ITeamDetailsViewController {
    func showTeamDetails(team: TeamDetailsModel.Response) {
        self.team = team
        reloadData()
        name.text = team.name
        shortname.text = team.shortName
        tla.text = team.tla
        address.text = team.address
        email.text = team.email
        founded.text = String(describing: team.founded)
        clubcolor.text = team.clubColors
        venue.text = team.venue
        phone.setTitle( team.phone,for: .normal)
        webSite.setTitle( team.website,for: .normal)
        crestUrl.setTitle( team.crestURL , for: .normal)
    }
}
extension TeamDetailsViewController {
    func setUpUI(){
        setUpNavigation()
        registerTableCell()
        registerCollectionCell()
    }
    func setUpNavigation(){
        navigationItem.title = "List of teams"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = .black
        navigationItem.setLeftBarButton(back, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    func registerTableCell() {
        let cell = UINib(nibName: "SquadTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "SquadTableViewCell")
    }
    func registerCollectionCell() {
        let cell = UINib(nibName: "CompetitionsCollectionViewCell", bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: "CompetitionsCollectionViewCell")
    }
 
}
extension TeamDetailsViewController{
    func getTeamDetails() {
        interactor?.getTeamDetails()
    }
    func reloadData() {
        tableView.reloadData()
        collectionView.reloadData()
    }
    fileprivate func OpenURl(url: String) {
        if let url = URL(string: url) {
            UIApplication.shared.open(url)
        }
    }
}
extension TeamDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return team?.squad?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SquadTableViewCell", for: indexPath)
        let player = team?.squad?[indexPath.row]
        cell.textLabel?.isHidden = false
        cell.textLabel?.text = player?.name
        return cell
    }
}
extension TeamDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return team?.activeCompetitions?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CompetitionsCollectionViewCell", for: indexPath) as! CompetitionsCollectionViewCell
        let activeCompetitions = team?.activeCompetitions?[indexPath.row]
        cell.textLabel?.isHidden = false
        cell.textLabel?.text = activeCompetitions?.name
        return cell
    }
}
