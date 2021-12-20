import request from '@/utils/request'


export function delEmps(id) {
    return request({
      url: '/emp/del',
      method: 'get',
      params: { id }
    })
  }

export function add(emp) {
    return request({
      url: '/emp/add',
      method: 'post',
      data:emp
    })
  }

export function get(id) {
    return request({
      url: '/emp/get',
      method: 'get',
      params:{id}
    })
  }

export function update(emp) {
    return request({
      url: '/emp/update',
      method: 'post',
      data:emp
    })
  }