import {
    createRouter,
    createWebHashHistory
} from "vue-router";
import Home from "../views/Home.vue";

const routes = [{
    path: '/',
    redirect: '/dashboard'
}, {
    path: "/",
    name: "Home",
    component: Home,
    children: [
        {
            path: "/dashboard",
            name: "dashboard",
            meta: {
                title: '系统首页'
            },
            component: () => import( /* webpackChunkName: "dashboard" */ "../views/Dashboard.vue")
        },
        {
            path: "/echart_01",
            name: "echart_01.vue",
            meta: {
                title: '饼图'
            },
            component: () => import( /* webpackChunkName: "table" */ "../views/echarts/echart_01.vue")
        },
        {
            path: "/echart_02",
            name: "echart_02.vue",
            meta: {
                title: '柱状图'
            },
            component: () => import( /* webpackChunkName: "table" */ "../views/echarts/echart_02.vue")
        },
        {
            path: "/Pageinfo",
            name: "Pageinfo",
            meta: {
                title: '统计页面'
            },
            component: () => import( /* webpackChunkName: "dashboard" */ "../views/Pageinfo.vue")
        },


        {
            path: "/Pageinfo1",
            name: "Pageinfo1",
            meta: {
                title: '统计页面01'
            },
            component: () => import( /* webpackChunkName: "dashboard" */ "../views/pageinfo/Pageinfo1.vue")
        },
        {
            path: "/Pageinfo2",
            name: "Pageinfo2",
            meta: {
                title: '统计页面02'
            },
            component: () => import( /* webpackChunkName: "dashboard" */ "../views/pageinfo/Pageinfo2.vue")
        },
        {
            path: "/Pageinfo3",
            name: "Pageinfo3",
            meta: {
                title: '统计页面03'
            },
            component: () => import( /* webpackChunkName: "dashboard" */ "../views/pageinfo/Pageinfo3.vue")
        },
        {
            path: "/Pageinfo4",
            name: "Pageinfo4",
            meta: {
                title: '统计页面04'
            },
            component: () => import( /* webpackChunkName: "dashboard" */ "../views/pageinfo/Pageinfo4.vue")
        },
        {
            path: "/Pageinfo5",
            name: "Pageinfo5",
            meta: {
                title: '统计页面05'
            },
            component: () => import( /* webpackChunkName: "dashboard" */ "../views/pageinfo/Pageinfo5.vue")
        },


        {
            path: "/AdmininfoTable",
            name: "AdmininfoTable",
            meta: {
                title: '管理员信息'
            },
            component: () => import(  "../views/AdmininfoTable.vue")
        },
        {
            path: "/CarouselTable",
            name: "CarouselTable",
            meta: {
                title: '轮播图'
            },
            component: () => import(  "../views/CarouselTable.vue")
        },
        {
            path: "/CommentinfoTable",
            name: "CommentinfoTable",
            meta: {
                title: '课程评价'
            },
            component: () => import(  "../views/CommentinfoTable.vue")
        },
        {
            path: "/DatainfoTable",
            name: "DatainfoTable",
            meta: {
                title: '课程信息'
            },
            component: () => import(  "../views/DatainfoTable.vue")
        },
        {
            path: "/NoticeinfoTable",
            name: "NoticeinfoTable",
            meta: {
                title: '公告信息'
            },
            component: () => import(  "../views/NoticeinfoTable.vue")
        },
        {
            path: "/ScoreinfoTable",
            name: "ScoreinfoTable",
            meta: {
                title: '评分信息'
            },
            component: () => import(  "../views/ScoreinfoTable.vue")
        },
        {
            path: "/ShoucangTable",
            name: "ShoucangTable",
            meta: {
                title: '收藏信息'
            },
            component: () => import(  "../views/ShoucangTable.vue")
        },
        {
            path: "/SorttypeTable",
            name: "SorttypeTable",
            meta: {
                title: '分类信息'
            },
            component: () => import(  "../views/SorttypeTable.vue")
        },
        {
            path: "/StudyinfoTable",
            name: "StudyinfoTable",
            meta: {
                title: '学习记录'
            },
            component: () => import(  "../views/StudyinfoTable.vue")
        },

        {
            path: "/UserinfoTable",
            name: "UserinfoTable",
            meta: {
                title: '用户信息'
            },
            component: () => import(  "../views/UserinfoTable.vue")
        },


        {
            path: "/SchartA",
            name: "SchartA",
            meta: {
                title: '用户统计'
            },
            component: () => import( /* webpackChunkName: "table" */ "../views/SchartA.vue")
        }, {
            path: "/permission",
            name: "permission",
            meta: {
                title: '权限管理',
                permission: true
            },
            component: () => import( /* webpackChunkName: "permission" */ "../views/Permission.vue")
        }, {
            path: "/i18n",
            name: "i18n",
            meta: {
                title: '国际化语言'
            },
            component: () => import( /* webpackChunkName: "i18n" */ "../views/I18n.vue")
        }, {
            path: '/404',
            name: '404',
            meta: {
                title: '找不到页面'
            },
            component: () => import( /* webpackChunkName: "404" */ '../views/404.vue')
        }, {
            path: '/403',
            name: '403',
            meta: {
                title: '没有权限'
            },
            component: () => import( /* webpackChunkName: "403" */ '../views/403.vue')
        }, {
            path: '/user',
            name: 'user',
            meta: {
                title: '个人中心'
            },
            component: () => import( /* webpackChunkName: "user" */ '../views/User.vue')
        }]
}, {
    path: "/login",
    name: "Login",
    meta: {
        title: '登录'
    },
    component: () => import( /* webpackChunkName: "login" */ "../views/Login.vue")
}];

const router = createRouter({
    history: createWebHashHistory(),
    routes
});

router.beforeEach((to, from, next) => {
    document.title = `${to.meta.title} | vue系统`;
    const role = localStorage.getItem('ms_username');
    if (!role && to.path !== '/login') {
        next('/login');
    } else if (to.meta.permission) {
        // 如果是管理员权限则可进入，这里只是简单的模拟管理员权限而已
        role === 'admin' ?
            next() :
            next('/403');
    } else {
        next();
    }
});

export default router;
