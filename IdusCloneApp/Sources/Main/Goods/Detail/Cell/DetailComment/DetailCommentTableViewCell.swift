//
//  DetailCommentTableViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/04.
//

import UIKit

class DetailCommentTableViewCell: UITableViewCell {

    @IBOutlet weak var detailCommentCollectionView: UICollectionView!
    
    //데이터 배열
    var commentArray: Array<DetailComment> = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK: - Helpers
    func setNib()  {
        self.detailCommentCollectionView.dataSource = self
        self.detailCommentCollectionView.delegate = self
        
        let cellNib = UINib(nibName: "DetailCommentQCollectionViewCell", bundle: nil)
                self.detailCommentCollectionView.register(cellNib, forCellWithReuseIdentifier: "DetailCommentQCollectionViewCell")
        
        let cellANib = UINib(nibName: "DetailCommentACollectionViewCell", bundle: nil)
                self.detailCommentCollectionView.register(cellANib, forCellWithReuseIdentifier: "DetailCommentACollectionViewCell")
    }
}
//MARK: 테이블 뷰 셀 extension
extension DetailCommentTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return commentArray.count
        //return movieVO.popular.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // 컬렉션 뷰 한 줄에 2개가 딱 맞게 정사각형으로 들어가게!
        let width = detailCommentCollectionView.bounds.width
        //let height = reviewCollectionView.bounds.height
        
        if(commentArray[indexPath.row].productReply != nil){
            return CGSize(width: width, height: 149)
        }else{
            return CGSize(width: width, height: 62)
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(commentArray[indexPath.row].productReply != nil){
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCommentACollectionViewCell", for: indexPath) as? DetailCommentACollectionViewCell {
                cell.setCell(detailComment: commentArray[indexPath.row])
                return cell
            }
            }else{
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCommentQCollectionViewCell", for: indexPath) as? DetailCommentQCollectionViewCell {
                    cell.setCell(detailComment: commentArray[indexPath.row])
                    return cell
                }
            }
                
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("콜렉션 뷰 " + String(indexPath.row))
        
    }
    
    //데이터 가져올 함수
    
    func setCell(detailComment: Array<DetailComment> )  {
        self.commentArray = detailComment
        print(commentArray.count)
        self.detailCommentCollectionView.reloadData()
    }
}
