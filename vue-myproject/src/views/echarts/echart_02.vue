<template>
  <div ref="echarts_Chart" style="width: 80%; height: 500px;margin: 50px auto;"></div>
</template>


<script>
import {
  ref,
  reactive
} from "vue";
import {
  ElMessage,
  ElMessageBox
} from "element-plus";
import * as echarts from 'echarts';
import request from '../../utils/request';

export default {
  name: 'echarts_Chart',
  mounted() {
    this.initecharts_Chart();
  },
  methods: {
    initecharts_Chart() {


      const namesArray = ref([]); //名称
      const valsArray = ref([]); //数值
      const beanArray = ref([]); //数值


      var sql = "  select type as name,count(*) as val from studyinfo,datainfo where studyinfo.tid=datainfo.id group by type ";
      var data = {"sql": sql};
      request({
        url: '/selectAction',
        method: 'get',
        params: data
      }).then((res) => {
        console.log(res);
        for (var i = 0; i < res.data.length; i++) {
          var obj = res.data[i];
          namesArray.value.push(obj.name);
          valsArray.value.push(obj.val);
          beanArray.value.push({"name": obj.name, "value": obj.val});
        }


        // 基于准备好的dom，初始化echarts实例
        const myChart = echarts.init(this.$refs.echarts_Chart);
        var option = {
          title: {
            text: '课程知识点学习情况统计',
            left: 'center'
          },
          toolbox: {
            show: true,
            feature: {
              mark: {show: true},
              dataView: {show: true, readOnly: false},
              magicType: {
                show: true,
                type: ['pie', 'funnel'],
                option: {
                  funnel: {
                    x: '25%',
                    width: '50%',
                    funnelAlign: 'left',
                    max: 1548
                  }
                }
              },
              restore: {show: true},
              saveAsImage: {show: true}
            }
          },
          tooltip: {
            trigger: 'item'
          },
          //设置饼状图每个颜色块的颜色
          legend: {
            data: namesArray.value,
            orient: 'vertical',
            left: '0px',
          },
          series: [

            {

              name: '课程',
              // radius: ['20%', '80%'], 圆形圈
              radius: '55%',
              hoverAnimation: true,
              avoidLabelOverlap: true,
              label: {
                show: true, // 显示标签
                position: 'inside', // 在饼图内部显示标签
                formatter: '{b}：{d}%'
              },
              type: 'pie',
              data: beanArray.value,
              emphasis: {
                itemstyle: {
                  shadowBlur: 10,
                  shadowOffsetX: 0,
                  shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
              }
            }
          ]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
      });
    }
  }
}
</script>
