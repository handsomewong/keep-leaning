//入口文件
import Vue from 'vue'

//导入路由包
import VueRouter from 'vue-router'

//安装路由
Vue.use(VueRouter)

//导入router.js模块
import router from './router.js'

//导入mui样式
import './lib/mui/css/mui.min.css'
import './lib/mui/css/icons-extra.css'

//导入mint-ui组件
import {Header} from 'mint-ui'
Vue.component(Header.name,Header)

//导入app根组件
import app from './App.vue'

var vm = new Vue({
    el:'#app',
    render:c=>c(app),
    router //挂载路由对象到vm
})