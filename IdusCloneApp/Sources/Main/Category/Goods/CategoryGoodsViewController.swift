//
//  CategoryGoodsViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/09.
//

import UIKit
import XLPagerTabStrip
class CategoryGoodsViewController: UIViewController,IndicatorInfoProvider, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    var labelArray = ["디저트, 베이커리, 떡", "음료 (커피, 차 등)","전통주", "수제 반찬", "그 외 수제먹거리", "농축수산물", "의류, 홈웨어", "패션잡화", "지갑 (지폐,카드,동전,명함)","가방, 파우치","시계", "섬유, 퀼트","남성 수제화","여성 수제화", "육아, 아동", "반지","귀걸이","목걸이","팔찌","그 외 액세서리","꽃 (생화, 드라이, 다육 등)","캔들, 디퓨저, 방향제","인테리어 소품","도자기","주방, 생활","반려동물 용품","파인아트","공예","휴대폰 케이스","전자기기 관련","문구, 팬시","페인팅, 캐리커쳐, 캘리","향수, 화장품, 뷰티","비누, 천연비누","기타"]
    
    var imageArray = [#imageLiteral(resourceName: "디저트, 베이커리, 떡"),#imageLiteral(resourceName: "음료 (커피, 차 등)"), #imageLiteral(resourceName: "전통주"), #imageLiteral(resourceName: "수제 반찬"), #imageLiteral(resourceName: "그 외 수제먹거리") , #imageLiteral(resourceName: "농축수산물"), #imageLiteral(resourceName: "의류, 홈웨어"), #imageLiteral(resourceName: "패션잡화"),#imageLiteral(resourceName: "지갑 (지폐,카드,동전,명함)"),#imageLiteral(resourceName: "가방, 파우치"), #imageLiteral(resourceName: "시계"), #imageLiteral(resourceName: "섬유, 퀼트"), #imageLiteral(resourceName: "남성 수제화"), #imageLiteral(resourceName: "여성 수제화"), #imageLiteral(resourceName: "육아, 아동"),#imageLiteral(resourceName: "반지"), #imageLiteral(resourceName: "귀걸이"), #imageLiteral(resourceName: "목걸이"),#imageLiteral(resourceName: "팔찌"),#imageLiteral(resourceName: "그 외 액세서리"), #imageLiteral(resourceName: "꽃 (생화, 드라이, 다육 등)"), #imageLiteral(resourceName: "캔들, 디퓨저, 방향제"), #imageLiteral(resourceName: "인테리어 소품"), #imageLiteral(resourceName: "도자기"), #imageLiteral(resourceName: "주방, 생활"), #imageLiteral(resourceName: "반려동물 용품"),#imageLiteral(resourceName: "파인아트"),#imageLiteral(resourceName: "공예"), #imageLiteral(resourceName: "휴대폰 케이스"),#imageLiteral(resourceName: "전자기기 관련"), #imageLiteral(resourceName: "문구, 팬시"),#imageLiteral(resourceName: "페인팅, 캐리커쳐, 캘리"),#imageLiteral(resourceName: "향수, 화장품, 뷰티"),#imageLiteral(resourceName: "비누, 천연비누"), #imageLiteral(resourceName: "기타")]
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNib()
        
        collectionView.reloadData()
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "작품")
      }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 가져온 데이터 개수
        return labelArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryGoodsCollectionViewCell", for: indexPath) as? CategoryGoodsCollectionViewCell else{
            return UICollectionViewCell()
        }
        
        cell.label.text = labelArray[indexPath.row]
        cell.imageView.image = imageArray[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // 컬렉션 뷰 한 줄에 3개가 딱 맞게 정사각형으로 들어가게!
        var width1 = self.collectionView.bounds.width / 5
        return CGSize(width: width1, height: width1)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    func setNib() {
        // Delegate = self -> 제스쳐, UI
        collectionView.delegate = self
        // DataSource = self -> 데이터관리
        collectionView.dataSource = self
        
        // #1
        let curatingCellNib = UINib(nibName: "CategoryGoodsCollectionViewCell", bundle: nil)
        self.collectionView.register(curatingCellNib, forCellWithReuseIdentifier: "CategoryGoodsCollectionViewCell")
    }
}
