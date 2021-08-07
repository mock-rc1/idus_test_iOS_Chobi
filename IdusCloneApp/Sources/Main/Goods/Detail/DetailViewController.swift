//
//  DetailViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/02.
//
import UIKit
class DetailViewController: BaseViewController, DetailImageCollectionViewCellDelegate, DetailKeywordCollectionViewCellDelegate, MyProtocol{
    func didSelectBtnHeart() {
        self.btnHeart.setImage(#imageLiteral(resourceName: "찜주황"), for: .normal)
        self.labelHeart.text = String( Int(labelHeart.text!)! + 1)
    }
    
    //MARK: - Outlet
    
    //테이블 뷰
    @IBOutlet weak var tableView: UITableView!
    
    // Datamanager
    lazy var dataManager: DetailDataManager = DetailDataManager()
    
    //상세 페이지 데이터
    var detailData: DetailResult?
    
    //몇 번째 값인지
    var data: String?
    
    // 후기 개수, type(사진: true, false)
    var reviewCount: Int?
    var reviewPictureCount = 0
    
    // 댓글 개수
    var commentCount: Int?
    var commentAnswerCount = 0
    
    //MARK: - LifeCycle
    @IBOutlet weak var btnHeart: UIButton!
    @IBOutlet weak var labelHeart: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.presentAlert(title: data!)
        
        //UI 커스텀
        configureUI()
        
        //tableview
        setupTableView()
        
        //get data
        dataManager.getGoodsDetail(vc: self, userIdx: 3, prodIdx: 1)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Helpers
    //내비 커스텀
    func configureUI() {
        navigationController?.hidesBarsOnSwipe = false
        let searchIcon = UIBarButtonItem(image: #imageLiteral(resourceName: "탭바_검색"), style: .plain, target: self, action: #selector(searchSth))
        let homeIcon = UIBarButtonItem(image: #imageLiteral(resourceName: "탭바_작품"), style: .plain, target: self, action: #selector(moveHome))
        let cartIcon = UIBarButtonItem(image: #imageLiteral(resourceName: "상단_장바구니"), style: .plain, target: self, action: #selector(moveCart))
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(moveHome))
        
        navigationItem.rightBarButtonItems = [ cartIcon, homeIcon, searchIcon]
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        print(UITabBarController().tabBar.frame.height)
        self.tabBarController?.tabBar.isHidden = true
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
    //MARK: 구매
    @IBAction func btnBuy(_ sender: Any) {
        let nextVC = OptionViewController()
        nextVC.modalPresentationStyle = .custom
        nextVC.price = detailData?.getDetailRes.saleCost!
        nextVC.shipping = detailData?.getDetailRes.deliveryCost!
        nextVC.detailData = detailData
        self.present(nextVC, animated: true, completion: nil)
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
    
    //키워드
    func collectionView(collectionviewcell: DetailKeywordCollectionViewCell?, index: Int, didTappedInTableViewCell: DetailKeywordTableViewCell) {
        
    }
    
    
    
}

// 테이블뷰 extension
extension DetailViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(String(lists.count) + " 줄")
        
        return 11
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailImageTableViewCell") as? DetailImageTableViewCell {
                cell.detailImageCellDelegate = self
                if let x = detailData {
                    cell.setCell(row: x.getDetailProdImgRes)
                }
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailSummaryTableViewCell") as? DetailSummaryTableViewCell {
                cell.delegate = self
                //cell.setCell(row: eventArray)
                if let x = detailData {
                    cell.setCell(detailSummary: x.getDetailRes)
                }
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
                if let x = detailData {
                    cell.labelDetailInfo.text = x.getDetailRes.prodComment
                }
                //cell.labelDetailInfo.text = detailInfo
                return cell
            }
        case 4:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailReviewTableViewCell") as? DetailReviewTableViewCell {
                //cell.todayGoodsCellDelegate = self
                //cell.setCell(row: todayGoodsArray)
                if let x = detailData {
                    cell.setCell(detailReview: x.getDetailReviewRes, detailReviewProd: x.getDetailReviewProdRes)
                }
                return cell
            }
        case 5:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailKeywordTableViewCell") as? DetailKeywordTableViewCell {
                cell.detailKeywordCellDelegate = self
                if let x = detailData {
                    cell.setCell(row: x.getDetailKeyWordRes)
                }
                return cell
            }
            //댓글
        case 6:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCommentTableViewCell") as? DetailCommentTableViewCell {
                //cell.todayGoodsCellDelegate = self
                //cell.setCell(row: todayGoodsArray)
                if let x = detailData {
                    cell.setCell(detailComment: x.getDetailCommentRes)
                }
                return cell
            }
        //댓글 Q&A
        
        case 7:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailAuthorTableViewCell") as? DetailAuthorTableViewCell {
                if let x = detailData {
                    cell.setCell(detailSummary: x.getDetailRes)
                }
                return cell
            }
        case 8:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailOtherGoodsTableViewCell") as? DetailOtherGoodsTableViewCell {
                //cell.todayGoodsCellDelegate = self
                if let x = detailData {
                    cell.setCell(row: x.getDetailAuthorProdRes)
                }
                return cell
            }
        case 9:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailWithGoodsTableViewCell") as? DetailWithGoodsTableViewCell {
                //cell.todayGoodsCellDelegate = self
                if let x = detailData {
                    cell.setCell(with: x.getDetailCateProdRes, hot: x.getDetailHotRes,i: 1)
                }
                return cell
            }
        case 10:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailWithGoodsTableViewCell") as? DetailWithGoodsTableViewCell {
                //cell.todayGoodsCellDelegate = self
                if let x = detailData {
                    cell.setCell(with: x.getDetailCateProdRes, hot: x.getDetailHotRes,i: 0)
                }
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
            if let x = reviewCount{
                return CGFloat(141 + (242 * reviewPictureCount) + (111 * (x - reviewPictureCount)) + 5)
            }else{
                return CGFloat(141 + (242 * reviewPictureCount) + (111 * (reviewPictureCount)))
            }
            // 이미지 있는 것 없는 것 개수
        case 5: //키워드
            return 140
        case 6: //댓글
            if let x = commentCount{
                return CGFloat(128 + 20 + (149 * commentAnswerCount) + (62 * (x - commentAnswerCount)) - 62)
            }else{
                return CGFloat(128 + (149 * commentAnswerCount) + (62 * (commentAnswerCount)) - 62)
            }
        case 7:
            return 285
        case 8:
            return 310
        case 9, 10:
            return 320 + 200
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
        /*
        
        */
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


extension DetailViewController {
    func didSuccessGoodsDetail(result: DetailResponse) {
        detailData = result.result
        
        print("DEBUG: 데이터 로딩 성공")
        print(detailData!.getDetailProdImgRes)
        //리뷰
        reviewCount = detailData!.getDetailReviewRes.count
        for i in detailData!.getDetailReviewRes{
            if i.reviewImage != ""{
                reviewPictureCount += 1
            }
        }
        //찜
        labelHeart.text = "\( detailData!.getDetailRes.totalLike!)"
        
        //댓글 개수
        commentCount = detailData!.getDetailCommentRes.count
        for i in detailData!.getDetailCommentRes{
            if i.productReply != ""{
                commentAnswerCount += 1
            }
        }
        
        tableView.reloadData()
        //print(detailData?.getDetailProdImgRes)
    }
    
    func failedToRequest(message: String) {
        print("DEBUG: 데이터 로딩 실패.")
    }
}
