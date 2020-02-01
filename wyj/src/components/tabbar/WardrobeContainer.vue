<template>
    <div>
        <!--顶部滑动条 -->
        <div id="slider" class="mui-slider">
				<div id="sliderSegmentedControl" class="mui-scroll-wrapper mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
					<div class="mui-scroll">
						<a class="mui-control-item mui-active" href="#item1mobile" data-wid="tab-top-subpage-1.html">
							上衣
						</a>
						<a class="mui-control-item" href="#item2mobile" data-wid="tab-top-subpage-2.html">
							裤子
						</a>
						<a class="mui-control-item" href="#item3mobile" data-wid="tab-top-subpage-3.html">
							裙装
						</a>
						<a class="mui-control-item" href="#item4mobile" data-wid="tab-top-subpage-4.html">
							外套
						</a>
						<a class="mui-control-item" href="#item5mobile" data-wid="tab-top-subpage-5.html">
							鞋子
						</a>
						<a class="mui-control-item" href="#item6mobile" data-wid="tab-top-subpage-6.html">
							配饰
						</a>
					</div>
				</div>

			</div>
			<!-- 中间列表 -->
			<div>
				<ul id="OA_task_1" class="mui-table-view">
				<li class="mui-table-view-cell">
					<div class="mui-slider-right mui-disabled">
						<a class="mui-btn mui-btn-red">删除</a>
					</div>
					<div class="mui-slider-handle">
						左滑显示删除
					</div>
				</li>
				
			</ul>
			</div>

			<!-- 底部添加按钮 -->
			<div>
				<button type="button" class="mui-btn mui-btn-primary mui-btn-block mui-btn-outlined">添加</button>
			</div>
    </div>
</template>

<script>
import mui from '../../lib/mui/js/mui.min.js'


export default{
    data() {
        return {};
	},
	mounted() {
    	// 需要在组件的 mounted 事件钩子中，注册 mui 的 scroll 滚动事件
        mui('.mui-scroll-wrapper').scroll({
          deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
        });
  	},
    methods: {}
};
</script>

<style lang="sass" scoped>

</style>