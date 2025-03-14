//
//  ReportRenters.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 07/05/1443 AH.
//


import UIKit

class ReportRenters: UIViewController {
    
    var reports: Array<ReportRenter> = []
    
    private var hotelCV: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("بلاغات الاشتباه", comment:" ")
        
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 25
        layout.minimumInteritemSpacing = 25
        layout.itemSize = CGSize(width: 340,
                                 height: 130)
        hotelCV = UICollectionView(frame: .zero,
                                   collectionViewLayout: layout)
        
        guard let hotelCV = hotelCV else {
            return
        }
        
        hotelCV.register(Cellr.self, forCellWithReuseIdentifier: "cell")
        hotelCV.dataSource = self
        hotelCV.delegate = self
        view.addSubview(hotelCV)
        hotelCV.frame = view.bounds
        hotelCV.backgroundColor = #colorLiteral(red: 0.8992940602, green: 0.8936767668, blue: 0.8912667796, alpha: 1)
        
        ReportRenterService.shared.listenToReport { newRenter in
            self.reports = newRenter
            self.hotelCV!.reloadData()
        }
    }
    
}
var selectedIn = -1
extension ReportRenters: UICollectionViewDelegate  , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate  {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 370, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reports.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Cellr
        
        let renter = reports[indexPath.row]
        cell.label2.text = " بلاغ من احد الفنادق بالمستأجر  \(renter.name)"
        cell.label3.text = " الذي يحمل رقم الهويه \(renter.id)"
        cell.label4.text = " اشتباه في:  \(renter.reason)     "
        //            cell.label5.text = "منذ   \(Date()  )"
        
        return cell
    }
    
    
}


class Cellr: UICollectionViewCell {
    
    static let identifire = "Cell"
    
    public let label2: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 19, weight: .regular)
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "Avenir-Light", size: 19)
        return label
    }()
    
    public let label3: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "Avenir-Light", size: 18)
        return label
    }()
    public let label4: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .black
        label.font = UIFont(name: "Avenir-Light", size: 17)
        label.textAlignment = .right
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.frame.size.width = 250
        label.sizeToFit()
        return label
    }()
    
    public let label5: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .black
        label.font = UIFont(name: "Avenir-Light", size: 17)
        label.textAlignment = .right
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.frame.size.width = 250
        label.sizeToFit()
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.clipsToBounds = true
        contentView.clipsToBounds = true
        
        contentView.backgroundColor = #colorLiteral(red: 0.6797825694, green: 0.768997848, blue: 0.769477129, alpha: 1)
        contentView.layer.cornerRadius = 13
        contentView.addSubview(label2)
        contentView.addSubview(label3)
        contentView.addSubview(label4)
        contentView.addSubview(label5)
        contentView.layer.borderWidth = 3
        contentView.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //left right
        label2.frame = CGRect(x: 33,
                              y: -35,
                              width: 300,
                              height: contentView.frame.size.height-30)
        
        label3.frame = CGRect(x: 40,
                              y: 17,
                              width: 300,
                              height: contentView.frame.size.height-30)
        label4.frame = CGRect(x: -167,
                              y: 58,
                              width: 500,
                              height: contentView.frame.size.height-30)
        
        label5.frame = CGRect(x: -167,
                              y: 83,
                              width: 500,
                              height: contentView.frame.size.height-30)
    }
    
}






