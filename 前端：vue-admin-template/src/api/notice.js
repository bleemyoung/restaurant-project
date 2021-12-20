import request from '@/utils/request'

export function getNotices() {
    return request({
      url: '/notice/all',
      method: 'get'
    })
  }

export function add(notice) {
    return request({
      url: '/notice/add',
      method: 'post',
      data:notice
    })
  }