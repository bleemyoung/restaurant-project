import request from '@/utils/request'

export function getDishes() {
    return request({
      url: '/dishes/all',
      method: 'get'
    })
  }

export function cook(id) {
    return request({
      url: '/dishes/cook',
      method: 'get',
      params:{id}
    })
  }
