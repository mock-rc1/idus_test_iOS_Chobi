//
//  DetailViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/02.
//
import UIKit
class DetailViewController: BaseViewController, DetailImageCollectionViewCellDelegate{
    //MARK: - Outlet
    
    //테이블 뷰
    @IBOutlet weak var tableView: UITableView!
    
    //몇 번째 값인지
    var data: String?
    
    // MARK: 예시 데이터
    
    //상세 이미지
    let detailImageArray: Array<UIImage> = [#imageLiteral(resourceName: "상세이미지"), #imageLiteral(resourceName: "상세이미지"),#imageLiteral(resourceName: "상세이미지")]
    
    // 상세 정보
    let detailInfo = "깨끗하\n\n고 러블리한 무드의 담수진주 목걸이 ‘이미 라뺄르 담수진주 목걸이’Aimez la perle _ 불어로 진주를 사랑하다 라는 의미라고해요 :)이 목걸이를 보자마자 반해버린 지인께서 지어주신 이름이랍니다💕사랑스러운 포인트의 하트모양 잠금장식으로 유니크하면서도 러블리한 포인트를 주었어요 !원통형의 큐빅참을 돌리면 잠금장식을 열 수 있어서착용도 편하게 가능하세요 :)자유로운 형태의 천연 담수진주는내추럴함과 고급스러움을 풍긴답니다.얼스룩에도, 빈티지한 룩에도, 러블리한 룩에도너무나 멋지게 연출하시기 좋은 담수진주 목걸이 추천드려요🖤[material]담수진체인 : 써지컬스틸잠금장식 : 신주,큐[color]화이트진주, 골드체인[size]43.5cm원하시는 사이즈로 주문제작 가능합니다.작가문의로 메세지주세요 :)제품 측정방식에 따라 미세한 오차가 있을 수 있는점미리 양해 부탁드립니다.🌷"
    
    //MARK: - LifeCycle
    @IBOutlet weak var btnHeart: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presentAlert(title: data!)
        configureNavi()
        print(UITabBarController().tabBar.frame.height)
        self.tabBarController?.tabBar.isHidden = true
        //tableview
        setupTableView()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Helpers
    //내비 커스텀
    func configureNavi() {
        navigationController?.hidesBarsOnSwipe = false
        let searchIcon = UIBarButtonItem(image: #imageLiteral(resourceName: "탭바_검색"), style: .plain, target: self, action: #selector(searchSth))
        let homeIcon = UIBarButtonItem(image: #imageLiteral(resourceName: "탭바_작품"), style: .plain, target: self, action: #selector(moveHome))
        let cartIcon = UIBarButtonItem(image: #imageLiteral(resourceName: "상단_장바구니"), style: .plain, target: self, action: #selector(moveCart))
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(moveHome))
        
        navigationItem.rightBarButtonItems = [ cartIcon, homeIcon, searchIcon]
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)

    }
    
    // 내비게이션 바 버튼
    @objc func searchSth() {
        
    }

    @objc func moveHome() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func moveCart() {
        
    }
    
    // 탭바 버튼
    @IBAction func btnBuy(_ sender: Any) {
    }
    func changeHeart() {
        btnHeart.setImage(#imageLiteral(resourceName: "찜_주황"), for: .normal)
    }
    
    //MARK: 델리게이트
    // 상세 이미지
    //배너
    func collectionView(collectionviewcell: DetailImageCollectionViewCell?, index: Int, didTappedInTableViewCell: DetailImageTableViewCell) {
        //이미지 누르면~~
    }
}

// 테이블뷰 extension
extension DetailViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(String(lists.count) + " 줄")
        return 14
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailImageTableViewCell") as? DetailImageTableViewCell {
                cell.detailImageCellDelegate = self
                cell.setCell(row: detailImageArray)
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailSummaryTableViewCell") as? DetailSummaryTableViewCell {
                //cell.eventCellDelegate = self
                //cell.setCell(row: eventArray)
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailShippingTableViewCell") as? DetailShippingTableViewCell {
                //cell.todayGoodsCellDelegate = self
                //cell.setCell(row: todayGoodsArray)
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailInfoTableViewCell") as? DetailInfoTableViewCell {
                //cell.todayGoodsCellDelegate = self
                //cell.setCell(row: todayGoodsArray)
                cell.labelDetailInfo.text = detailInfo
                return cell
            }
        case 4:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailReviewTableViewCell") as? DetailReviewTableViewCell {
                //cell.todayGoodsCellDelegate = self
                //cell.setCell(row: todayGoodsArray)
                return cell
            }
        case 5:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailKeywordTableViewCell") as? DetailKeywordTableViewCell {
                //cell.todayGoodsCellDelegate = self
                //cell.setCell(row: todayGoodsArray)
                return cell
            }
            //댓글
        case 6:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCommentTableViewCell") as? DetailCommentTableViewCell {
                //cell.todayGoodsCellDelegate = self
                //cell.setCell(row: todayGoodsArray)
                return cell
            }
        case 7:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCommentQTableViewCell") as? DetailCommentQTableViewCell {
                //cell.todayGoodsCellDelegate = self
                //cell.setCell(row: todayGoodsArray)
                return cell
            }
        case 8:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCommentATableViewCell") as? DetailCommentATableViewCell {
                //cell.todayGoodsCellDelegate = self
                //cell.setCell(row: todayGoodsArray)
                return cell
            }
        case 9:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCommentWTableViewCell") as? DetailCommentWTableViewCell {
                //cell.todayGoodsCellDelegate = self
                //cell.setCell(row: todayGoodsArray)
                return cell
            }
        case 10:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailAuthorTableViewCell") as? DetailAuthorTableViewCell {
                //cell.todayGoodsCellDelegate = self
                //cell.setCell(row: todayGoodsArray)
                return cell
            }
        case 11:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailOtherGoodsTableViewCell") as? DetailOtherGoodsTableViewCell {
                //cell.todayGoodsCellDelegate = self
                //cell.setCell(row: todayGoodsArray)
                return cell
            }
        case 12:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailWithGoodsTableViewCell") as? DetailWithGoodsTableViewCell {
                //cell.todayGoodsCellDelegate = self
                //cell.setCell(row: todayGoodsArray)
                return cell
            }
        case 13:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailWithGoodsTableViewCell") as? DetailWithGoodsTableViewCell {
                //cell.todayGoodsCellDelegate = self
                //cell.setCell(row: todayGoodsArray)
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("선택된 행은 \(indexPath.row) 입니다.")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 414
        case 1:
            return 394
        case 2:
            return 186
        case 3:
            return tableView.estimatedRowHeight
        case 4:
            return (141 + 242 + 111 + 2) // 이미지 있는 것 없는 것 개수
        case 5:
            return 230
        case 6:
            return tableView.estimatedRowHeight
        case 7:
            return tableView.estimatedRowHeight
        case 8:
            return tableView.estimatedRowHeight
        case 9:
            return tableView.estimatedRowHeight
        case 10:
            return 285
        case 11:
            return tableView.estimatedRowHeight
        case 12:
            return tableView.estimatedRowHeight
        case 13:
            return tableView.estimatedRowHeight
        default:
            return 100
        }
    }
    
    //tableview cell에 들어갈 cell들의 Nib을 등록
    private func setupTableView(){
            // Register the xib for tableview cell
            tableView.delegate = self
            tableView.dataSource = self
        
        // 상세 이미지
            let detailImageCellNib = UINib(nibName: "DetailImageTableViewCell", bundle: nil)
            self.tableView.register(detailImageCellNib, forCellReuseIdentifier: "DetailImageTableViewCell")
        // 요약 정보
            let detailSummaryCellNib = UINib(nibName: "DetailSummaryTableViewCell", bundle: nil)
            self.tableView.register(detailSummaryCellNib, forCellReuseIdentifier: "DetailSummaryTableViewCell")
        
        // 배송 정보
            let detailShippingCellNib = UINib(nibName: "DetailShippingTableViewCell", bundle: nil)
            self.tableView.register(detailShippingCellNib, forCellReuseIdentifier: "DetailShippingTableViewCell")
        
        //상세 정보
            let detailInfoCellNib = UINib(nibName: "DetailInfoTableViewCell", bundle: nil)
            self.tableView.register(detailInfoCellNib, forCellReuseIdentifier: "DetailInfoTableViewCell")
        
        // 리후기
        let detailReviewCellNib = UINib(nibName: "DetailReviewTableViewCell", bundle: nil)
        self.tableView.register(detailReviewCellNib, forCellReuseIdentifier: "DetailReviewTableViewCell")
        
        //키워드
        let detailKeywordCellNib = UINib(nibName: "DetailKeywordTableViewCell", bundle: nil)
        self.tableView.register(detailKeywordCellNib, forCellReuseIdentifier: "DetailKeywordTableViewCell")
        
        //댓글
        let detailCommentCellNib = UINib(nibName: "DetailCommentTableViewCell", bundle: nil)
        self.tableView.register(detailCommentCellNib, forCellReuseIdentifier: "DetailCommentTableViewCell")
        //댓글 - 질문
        let detailCommentQCellNib = UINib(nibName: "DetailCommentQTableViewCell", bundle: nil)
        self.tableView.register(detailCommentQCellNib, forCellReuseIdentifier: "DetailCommentQTableViewCell")
        //댓글 - 답
        let detailCommentACellNib = UINib(nibName: "DetailCommentATableViewCell", bundle: nil)
        self.tableView.register(detailCommentACellNib, forCellReuseIdentifier: "DetailCommentATableViewCell")
        //댓글 - 쓰기
        let detailCommentWCellNib = UINib(nibName: "DetailCommentWTableViewCell", bundle: nil)
        self.tableView.register(detailCommentWCellNib, forCellReuseIdentifier: "DetailCommentWTableViewCell")
        
        //작가 정보
        let detailAuthorCellNib = UINib(nibName: "DetailAuthorTableViewCell", bundle: nil)
        self.tableView.register(detailAuthorCellNib, forCellReuseIdentifier: "DetailAuthorTableViewCell")
        
        //판매중인 다른 작품들
        let detailOtherCellNib = UINib(nibName: "DetailOtherGoodsTableViewCell", bundle: nil)
        self.tableView.register(detailOtherCellNib, forCellReuseIdentifier: "DetailOtherGoodsTableViewCell")
        
        //이 작품과 함께 본 작품, 인기 작품
        let detailWithCellNib = UINib(nibName: "DetailWithGoodsTableViewCell", bundle: nil)
        self.tableView.register(detailWithCellNib, forCellReuseIdentifier: "DetailWithGoodsTableViewCell")
    }
}
