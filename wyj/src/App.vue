<template>
  <div class="app-container">

   <!-- header-->
   <mt-header fixed title="今天穿什么"></mt-header>
    <!-- center-->
    <transition mode="out-in">
    <router-view></router-view>
    </transition>

    <!-- tabbar-->
    <nav class="mui-bar mui-bar-tab">
			<router-link class="mui-tab-item" to="/home">
				<span class="mui-icon mui-icon-home"></span>
				<span class="mui-tab-label">首页</span>
			</router-link>
			<router-link class="mui-tab-item" to="/wardrobe">
				<span class="mui-icon mui-icon-extra mui-icon-extra-heart-filled"></span>
				<span class="mui-tab-label">衣橱</span>
			</router-link>
			<router-link class="mui-tab-item" to="/settings">
				<span class="mui-icon mui-icon-gear"></span>
				<span class="mui-tab-label">设置</span>
			</router-link>
		</nav>
      </div>
</template>

<script>

</script>


<style lang="scss" scoped>
.app-container{
  padding-top: 40px;
  overflow-x: hidden;
}

.v-enter{
  opacity: 0;
  transform: translateX(100%);
}

.v-leave-to{
  opacity: 0;
  transform: translateX(-100%);
}

.v-enter-active,
.v-leave-active{
  transition: all 0.3s ease;
}
</style>
