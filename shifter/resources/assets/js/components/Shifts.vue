<template>
  <div class="panel panel-default">
      <div class="panel-heading">Shifts
        <a href="#" class="btn pull-right btn-xs btn-primary"><span class="glyphicon glyphicon-plus"></span></a>
      </div>
      <div class="panel-body">
          <monday :height="96"></monday>
          <tuesday :height="96"></tuesday>
          <wednesday :height="96"></wednesday>
          <thursday :height="96"></thursday>
          <friday :height="96"></friday>
          <saturday :height="96"></saturday>
          <sunday :height="96"></sunday>
      </div>
  </div>
</template>

<script>
Vue.component('monday', {
  extends: VueChartJs.Bar,
  mounted () {
    this.renderChart({
      labels: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'],
      datasets: [
        {
          label: 'Monday',
          backgroundColor: '#129762',
          data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        }
      ]
    }, {responsive: true, maintainAspectRatio: false})
  }
}),
Vue.component('tuesday', {
  extends: VueChartJs.Bar,
  mounted () {
    this.renderChart({
      labels: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'],
      datasets: [
        {
          label: 'Tuesday',
          backgroundColor: '#5a0f46',
          data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        }
      ]
    }, {responsive: true, maintainAspectRatio: false})
  }
}),
Vue.component('wednesday', {
  extends: VueChartJs.Bar,
  mounted () {
    this.renderChart({
      labels: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'],
      datasets: [
        {
          label: 'Wednesday',
          backgroundColor: '#6988e6',
          data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        }
      ]
    }, {responsive: true, maintainAspectRatio: false})
  }
}),
Vue.component('thursday', {
  extends: VueChartJs.Bar,
  mounted () {
    this.renderChart({
      labels: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'],
      datasets: [
        {
          label: 'Thursday',
          backgroundColor: '#1c118e',
          data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        }
      ]
    }, {responsive: true, maintainAspectRatio: false})
  }
}),
Vue.component('friday', {
  extends: VueChartJs.Bar,
  mounted () {
    this.renderChart({
      labels: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'],
      datasets: [
        {
          label: 'Friday',
          backgroundColor: '#b57238',
          data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        }
      ]
    }, {responsive: true, maintainAspectRatio: false})
  }
}),
Vue.component('saturday', {
  extends: VueChartJs.Bar,
  mounted () {
    this.renderChart({
      labels: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'],
      datasets: [
        {
          label: 'Saturday',
          backgroundColor: '#6917fb',
          data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        }
      ]
    }, {responsive: true, maintainAspectRatio: false})
  }
}),
Vue.component('sunday', {
  extends: VueChartJs.Bar,
  mounted () {
    this.renderChart({
      labels: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'],
      datasets: [
        {
          label: 'Sunday',
          backgroundColor: '#2f5674',
          data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        }
      ]
    }, {responsive: true, maintainAspectRatio: false})
  }
})
</script>

<style lang="css">
</style>
