import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

/* Layout */
import Layout from '@/layout'

/**
 * Note: sub-menu only appear when route children.length >= 1
 * Detail see: https://panjiachen.github.io/vue-element-admin-site/guide/essentials/router-and-nav.html
 *
 * hidden: true                   if set true, item will not show in the sidebar(default is false)
 * alwaysShow: true               if set true, will always show the root menu
 *                                if not set alwaysShow, when item has more than one children route,
 *                                it will becomes nested mode, otherwise not show the root menu
 * redirect: noRedirect           if set noRedirect will no redirect in the breadcrumb
 * name:'router-name'             the name is used by <keep-alive> (must set!!!)
 * meta : {
    roles: ['admin','editor']    control the page roles (you can set multiple roles)
    title: 'title'               the name show in sidebar and breadcrumb (recommend set)
    icon: 'svg-name'/'el-icon-x' the icon show in the sidebar
    breadcrumb: false            if set false, the item will hidden in breadcrumb(default is true)
    activeMenu: '/example/list'  if set path, the sidebar will highlight the path you set
  }
 */

/**
 * constantRoutes
 * a base page that does not have permission requirements
 * all roles can be accessed
 */
export const constantRoutes = [
  {
    path: '/login',
    component: () => import('@/views/login/index'),
    hidden: true
  },

  {
    path: '/404',
    component: () => import('@/views/404'),
    hidden: true
  },

  {
    path: '/',
    component: Layout,
    redirect: '/dashboard',
    children: [{
      path: 'dashboard',
      name: 'Dashboard',
      component: () => import('@/views/dashboard/index'),
      meta: { title: 'Dashboard', icon: 'dashboard' }
    }]
  },

  {
    path: '/emp',
    component: Layout,
    redirect: '/emp/list',
    name: '职员管理',
    meta: { title: '职员管理', icon: 'el-icon-s-help' },
    children: [
      {
        path: 'list',
        name: '职工列表',
        component: () => import('@/views/emp/list'),
        meta: { title: '职工列表', icon: 'table' }
      },
      {
        path: 'delete',
        name: '删除职工',
        component: () => import('@/views/emp/delete'),
        meta: { title: '删除职工', icon: 'table' }
      },
      {
        path: 'add',
        name: '增加职工',
        component: () => import('@/views/emp/add'),
        meta: { title: '增加职工', icon: 'tree' }
      },
      {
        path: 'get',
        name: '得到职工',
        component: () => import('@/views/emp/get'),
        meta: { title: '得到职工', icon: 'tree' }
      },
      {
        path: 'update',
        name: '修改职工',
        component: () => import('@/views/emp/update'),
        meta: { title: '修改职工', icon: 'tree' }
      },
    ]
  },

  {
    path: '/dishes',
    component: Layout,
    redirect: '/dishes/list',
    name: '后厨管理',
    meta: { title: '后厨管理', icon: 'el-icon-s-help' },
    children: [
      {
        path: 'list',
        name: '订单信息',
        component: () => import('@/views/dishes/list'),
        meta: { title: '订单信息', icon: 'table' }
      },
      {
        path: 'finish',
        name: '烹饪菜品',
        component: () => import('@/views/dishes/finish'),
        meta: { title: '烹饪菜品', icon: 'table' }
      }
    ]
  },

  {
    path: '/customer',
    component: Layout,
    redirect: '/customer/show',
    name: 'customer',
    meta: { title: '顾客', icon: 'el-icon-s-help' },
    children: [
      {
        path: 'show',
        name: 'show',
        component: () => import('@/views/customer/order'),
        meta: { title: '点餐', icon: 'table' }
      },
      {
        path: 'edit',
        name: 'edit',
        component: () => import('@/views/customer/edit'),
        meta: { title: '顾客订单', icon: 'table' }
      }
    ]
  },

  {
    path: '/notice',
    component: Layout,
    redirect: '/notice/list',
    name: '公告管理',
    meta: { title: '公告管理', icon: 'el-icon-s-help' },
    children: [
      {
        path: 'list',
        name: '公告展示',
        component: () => import('@/views/notice/list'),
        meta: { title: '公告展示', icon: 'table' }
      },
      {
        path: 'add',
        name: '添加公告',
        component: () => import('@/views/notice/add'),
        meta: { title: '添加公告', icon: 'tree' }
      },
    ]
  },

 

  
  // 404 page must be placed at the end !!!
  { path: '*', redirect: '/404', hidden: true }
]

const createRouter = () => new Router({
  // mode: 'history', // require service support
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRoutes
})

const router = createRouter()

// Detail see: https://github.com/vuejs/vue-router/issues/1234#issuecomment-357941465
export function resetRouter() {
  const newRouter = createRouter()
  router.matcher = newRouter.matcher // reset router
}

export default router
