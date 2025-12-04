<template>
	<div>
		<div class="container">
			<div class="plugins-tips">
				vue-schart：vue.js封装sChart.js的图表组件。
			</div>
			<div class="schart-box">
				<div class="content-title">柱状图</div>
				<schart class="schart" canvasId="bar" :options="options1"></schart>
			</div>

			<div class="schart-box">
				<div class="content-title">饼状图</div>
				<schart class="schart" canvasId="pie" :options="options2"></schart>
			</div>


		</div>
	</div>
</template>

<script>
	import {
		ref,
		reactive
	} from "vue";
	import Schart from "../components/SchartWrapper.vue";
	//引入请求 request
	import request from '../utils/request';
	export default {
		name: "basecharts",
		components: {
		Schart,
	},
		setup() {
			const namesArray = ref([]); //名称
			const valsArray = ref([]); //数值
			// 获取表格数据
			const getCountData = () => {
				request({
					url: '/selectAction',
					method: 'get',
					params: {
						"sql": "select type as name,count(*) as val from datainfo group by type"
					}
				}).then((res) => {
					for (var i = 0; i < res.data.length; i++) {
						var obj = res.data[i];
						namesArray.value.push(obj.name);
						valsArray.value.push(obj.val);
					}
				});
			};

			getCountData(); //调用方法
			console.log(namesArray.value);
			console.log(valsArray.value);

			//柱状图	
			const options1 = {
				type: "bar",
				title: {
					text: "知识点分类统计柱状图",
				},
				bgColor: "#fbfbfb",
				labels: namesArray.value,
				datasets: [{
					label: "知识分类",
					fillColor: "rgba(241, 49, 74, 0.5)",
					data: valsArray.value,
				}],
			};

			//饼图
			const options2 = {
				type: "pie",
				title: {
					text: "知识点分类统计饼状图",
				},
				legend: {
					position: "left",
				},
				bgColor: "#fbfbfb",
				labels: namesArray.value,
				datasets: [{
					data: valsArray.value,
				}, ],
			};

			return {
				options1,
				options2,
				namesArray,
				valsArray
			};
		},
	};
</script>

<style scoped>
	.schart-box {
		display: inline-block;
		margin: 20px;
	}

	.schart {
		width: 600px;
		height: 400px;
	}

	.content-title {
		clear: both;
		font-weight: 400;
		line-height: 50px;
		margin: 10px 0;
		font-size: 22px;
		color: #1f2f3d;
	}
</style>
