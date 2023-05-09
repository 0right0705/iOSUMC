//
//  CartDelegate.swift
//  DelegatePattern
//
//  Created by 최영우 on 5/6/23.
//

import Foundation

protocol CartDelegate {
    func alarmCartIsFilled(itemCount: Int)
}
