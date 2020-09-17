//
//  SearchResult_VC.swift
//  BusBud
//
//  Created by Sajjad Sarkoobi on 9/16/20.
//

import UIKit

class SearchResult_VC: UIViewController {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    var searchModelData:SearchModel = SearchModel()
    var dataSource: [DeparturesCellViewModel] = []
    var modelManager = DeparturesModelManagaer()
    
    //Flag for loading more
    var canLoadMore:Bool = false
    var isLoadingData:Bool = false
    
    // it has to be define as Lazy, other than that view will NOT de initialize
    lazy var titleView = Bundle.main.loadNibNamed("Title_View", owner:self, options: nil)?.first as? Title_View
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTitleView()
        addRightNavItem()
        
        registerNibs()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 165
        
        
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
    }
    
    func addRightNavItem(){

        let rightItem = UIBarButtonItem(image: UIImage(named: "filter"), landscapeImagePhone: UIImage(named: "filter"), style: .plain, target: self, action: #selector(filterBtnAction))
        self.navigationItem.rightBarButtonItem = rightItem
    }

    
    func setTitleView(){
    
        guard let titleView = self.titleView else {
            return
        }

        let titleData = TitleViewModel(departureName: searchModelData.departureName, arrivalName: searchModelData.arrivalName, date: searchModelData.date)
        titleView.titleData = titleData
        titleView.initialize()
        self.navigationItem.titleView = titleView
    
    }


    @objc func filterBtnAction(){
        
    }
    

    func loadData(){
        
        if isLoadingData { return }
        
        isLoadingData = true
        APIClient.getSearchData(
            origin: searchModelData.departureGeoHash,
            destination: searchModelData.arrivalGeoHash,
            date: searchModelData.date,
            adult: searchModelData.adult,
            child: searchModelData.child,
            senior: searchModelData.senior,
            lang: searchModelData.lang,
            currency: searchModelData.currency,
            loadMore: canLoadMore,
            index:self.dataSource.count) { (result, httpResponse, resultString) in
            
            self.isLoadingData = false
            
            switch result {
            case .success(let data):

                
                self.canLoadMore = !data.complete
                

                
                self.dataSource = self.modelManager.addRouteData(route: data)
                
                
                //Some time departures are empty but you can load data
                if self.canLoadMore && self.dataSource.count == 0 && data.departures.count == 0 {
                    print("Load data again")
                    self.loadData()
                }
                
                self.reloadTableData()
                
                print("data.complete \( data.complete)")
         
                
            case .failure(let err):
                print("Errr:")
                print(err)
                break
            }
        }
    }

}



extension SearchResult_VC: UITableViewDelegate,UITableViewDataSource {
    
    func registerNibs(){
        tableView.register(SearchResultCell.registerNib(), forCellReuseIdentifier: SearchResultCell.cellIdentifier)
    }
    
    
    func reloadTableData(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultCell.cellIdentifier, for: indexPath) as! SearchResultCell
        
        cell.cellData = self.dataSource[indexPath.row]
        cell.configureCell()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //Using for Loading more data when reaching to the End
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == dataSource.count {
        
            if !isLoadingData && canLoadMore {
                print("loading more data")
                self.loadData()
            }
        }
    }
    
}
