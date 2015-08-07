//
//  CycleScrollDemoView.swift
//  CycleScrollViewDemo
//
//  Created by fengche on 15/8/7.
//  Copyright (c) 2015年 fengche. All rights reserved.
//

import UIKit


class CycleScrollDemoView: UIView , UIScrollViewDelegate {
    
    var scrollView = UIScrollView.new()
    
    var leftView = UIView.new()
    var centerView = UIView.new()
    var rightView = UIView.new()
    
    var currentPageNum:Int = 0
    
    var colorsArr = [
        UIColor.redColor() ,
        UIColor.orangeColor() ,
        UIColor.greenColor() ,
        UIColor.yellowColor()
    ];
    
    var selfWidth:CGFloat{
        get{
            return CGRectGetWidth(self.frame)
        }
    }
    
    var selfHeight:CGFloat{
        get{
            return CGRectGetHeight(self.frame)
        }
    }
    
    
    
    //MARK:- life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blackColor()
        initScrollView()
        initContentViews()
        setCurrentPage(currentPageNum)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- init
    func initScrollView(){
        scrollView.frame = self.frame;
        self.addSubview(scrollView)
        
        
        scrollView.contentSize = CGSizeMake(selfWidth * 3, selfHeight)
        scrollView.contentOffset = CGPointMake(selfWidth, 0)
        scrollView.delegate = self
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
    }
    
    
    func initContentViews(){
        leftView.frame = CGRectMake(0, 0, selfWidth, selfHeight)
        scrollView.addSubview(leftView)
        
        centerView.frame = CGRectMake(selfWidth, 0, selfWidth, selfHeight)
        scrollView.addSubview(centerView)
        
        rightView.frame = CGRectMake(selfWidth*2, 0, selfWidth, selfHeight)
        scrollView.addSubview(rightView)
    }
    
    
    
    
    //MARK:- delegate
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        //core code
        var arrCount = count(colorsArr)
        if(scrollView.contentOffset.x == selfWidth*2){
            //backwards
            currentPageNum =  (currentPageNum + 1 + arrCount)%arrCount
        }else if(scrollView.contentOffset.x == 0){
            //forwards
            currentPageNum =  (currentPageNum - 1 + arrCount)%arrCount
        }else{
            //not change
            return;
        }
        setCurrentPage(currentPageNum)
        scrollView.contentOffset = CGPointMake(selfWidth, 0)
    }
    
    
    //MARK:- private method
    func setCurrentPage(var pageNum:Int){
        //move the content to the correct page
        var arrCount = count(colorsArr)
        leftView.backgroundColor =  colorsArr[(pageNum - 1 + arrCount)%arrCount]
        centerView.backgroundColor = colorsArr[pageNum];
        rightView.backgroundColor =  colorsArr[(pageNum + 1 + arrCount)%arrCount]
    }
    
}
