import request from '@/utils/request'
//    customer


export function showDishes() {
    return request({
      url: '/menu/all',
      method: 'get'
    })
}

export function addDish() {
  return request({
    url: '/menu/add',
    method: 'get'
  })
}

export function delDish() {
  return request({
    url: '/menu/del',
    method: 'get'
  })
}