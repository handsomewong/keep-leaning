import VueRouter from 'vue-router'

//导入路由组件
import HomeContainer from './components/tabbar/HomeContainer.vue'
import WardrobeContainer from './components/tabbar/WardrobeContainer.vue'
import SettingsContainer from './components/tabbar/SettingsContainer.vue'

//创建路由对象
var router = new VueRouter({
  routes: [//配置路由规则
    {path:'/home',component: HomeContainer},
    {path:'/wardrobe',component: WardrobeContainer},
    {path:'/settings',component: SettingsContainer}
  ],
  linkActiveClass:'mui-active' //覆盖默认路由高亮的类
})

// 把路由对象暴露出去
export default router