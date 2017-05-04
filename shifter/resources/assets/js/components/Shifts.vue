<template>
  <div class="panel panel-default">
      <div class="panel-heading">Shifts
        <a data-toggle="modal" href="#addShift" class="btn pull-right btn-xs btn-primary"><span class="glyphicon glyphicon-plus"></span></a>
        <a @click="deleteShifts()" href="/dashboard" class="btn pull-right btn-xs btn-danger"><span class="glyphicon glyphicon-remove"></span></a>
        <div id="addShift" class="modal fade" role="dialog">
        <div class="modal-dialog">
          <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Add Shift</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
  <label for="fname">Day:</label>
  <select v-model="day" class="selectpicker">
  <option>Monday</option>
  <option>Tuesday</option>
  <option>Wednesday</option>
  <option>Thursday</option>
  <option>Friday</option>
  <option>Saturday</option>
  <option>Sunday</option>
</select>
</div>
<div class="form-group">
<label for="text">Start Time:</label>
<select v-model="start" class="selectpicker">
<option>00</option>
<option>01</option>
<option>02</option>
<option>03</option>
<option>04</option>
<option>05</option>
<option>06</option>
<option>07</option>
<option>08</option>
<option>09</option>
<option>10</option>
<option>11</option>
<option>12</option>
<option>13</option>
<option>14</option>
<option>15</option>
<option>16</option>
<option>17</option>
<option>18</option>
<option>19</option>
<option>20</option>
<option>21</option>
<option>22</option>
<option>23</option>
<option>24</option>
</select>
</div>
<div class="form-group">
<label for="fname">End Time:</label>
<select v-model="end" class="selectpicker">
<option>00</option>
<option>01</option>
<option>02</option>
<option>03</option>
<option>04</option>
<option>05</option>
<option>06</option>
<option>07</option>
<option>08</option>
<option>09</option>
<option>10</option>
<option>11</option>
<option>12</option>
<option>13</option>
<option>14</option>
<option>15</option>
<option>16</option>
<option>17</option>
<option>18</option>
<option>19</option>
<option>20</option>
<option>21</option>
<option>22</option>
<option>23</option>
<option>24</option>
</select>
</div>
      </div>
      <div class="modal-footer">
        <a href="/dashboard" data-dismiss="modal" class="btn btn-primary btn-danger">Cancel</a>
        <a @click="createShifts(day,start,end)" data-dismiss="modal" href="/dashboard" class="btn btn-primary btn-success">Add Shift</a>
      </div>
    </div>
        </div>
      </div>
    </div>
      <div class="panel-body">
        <canvas id="mon" height="30"></canvas>
        <canvas id="tue" height="30"></canvas>
        <canvas id="wed" height="30"></canvas>
        <canvas id="thur" height="30"></canvas>
        <canvas id="fri" height="30"></canvas>
        <canvas id="sat" height="30"></canvas>
        <canvas id="sun" height="30"></canvas>
      </div>
  </div>
</template>

<script>

export default {
        data() {
          return {
            shifts: [],
            day: null,
            start: null,
            end: null
          }
        },

         mounted() {
           this.readShifts(),
           this.drawCharts()
         },

        methods: {
          createShifts: function(day,start,end) {
            var day
            switch(day) {
              case "Monday":
              day = 0;
              break;
              case "Tuesday":
              day = 1
              break;
              case "Wednesday":
              day = 2
              break;
              case "Thursday":
              day = 3
              break;
              case "Friday":
              day = 4
              break;
              case "Saturday":
              day = 5
              break;
              case "Sunday":
              day = 6
              break;
            }
            axios.post('/api/v1/shift/'+day+'/'+start+'/'+end);
            this.readShifts();
          },
          readShifts () {
            axios.get('/api/v1/shift').then( response => {
              if(response.data.length != 0){
                this.shifts = response.data
                this.drawCharts(response.data, response.data.length)
              }
            });
          },
          updateShifts () {
            axios.post('/api/v1/shift/1/6/12');
          },
          deleteShifts: function() {
            axios.post('/api/v1/shift/1');
            this.readShifts()
          },
          drawCharts: function(arr, length) {
            for(var i = 0; i < length; i ++){
              switch(arr[i].day) {
                case 0:
                this.monday(arr[i])
                break;
                case 1:
                this.tuesday(arr[i])
                break;
                case 2:
                this.wednesday(arr[i])
                break;
                case 3:
                this.thursday(arr[i])
                break;
                case 4:
                this.friday(arr[i])
                break;
                case 5:
                this.saturday(arr[i])
                break;
                case 6:
                this.sunday(arr[i])
                break;
              }
            }
          },
          monday: function(arr){
            var canvas = document.getElementById("mon");
            var ctx = canvas.getContext("2d");

            var hours = []
            for(var i = 0; i < 25; i++) {
              if((i >= arr.start) && (i <= arr.end)){
                hours.push(1)
              } else {
                hours.push(0)
            }
          }

            var data = {
              labels: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'],
              datasets: [
                {
                  label: "Monday",
                  data: hours
                }]};

              var mondayChart = new Chart(ctx , {
                type: "bar",
                data: data,
              });
            },

            tuesday: function(arr){
              var canvas = document.getElementById("tue");
              var ctx = canvas.getContext("2d");

              var hours = []
              for(var i = 0; i < 25; i++) {
                if((i >= arr.start) && (i <= arr.end)){
                  hours.push(1)
                } else {
                  hours.push(0)
                }
              }

              var data = {
                labels: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'],
                datasets: [
                  {
                    label: "Tuesday",
                    data: hours
                  }]};

                var tuesdayChart = new Chart(ctx , {
                  type: "bar",
                  data: data,
                });
              },
              wednesday: function(arr){
                var canvas = document.getElementById("wed");
                var ctx = canvas.getContext("2d");

                var hours = []
                for(var i = 0; i < 25; i++) {
                  if((i >= arr.start) && (i <= arr.end)){
                    hours.push(1)
                  } else {
                    hours.push(0)
                  }
                }

                var data = {
                  labels: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'],
                  datasets: [
                    {
                      label: "Wednesday",
                      data: hours
                    }]};

                  var wednesdayChart = new Chart(ctx , {
                    type: "bar",
                    data: data,
                  });
                },
                thursday: function(arr){
                  var canvas = document.getElementById("thur");
                  var ctx = canvas.getContext("2d");

                  var hours = []
                  for(var i = 0; i < 25; i++) {
                    if((i >= arr.start) && (i <= arr.end)){
                      hours.push(1)
                    } else {
                      hours.push(0)
                    }
                  }

                  var data = {
                    labels: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'],
                    datasets: [
                      {
                        label: "Thursday",
                        data: hours
                      }]};

                    var thursdayChart = new Chart(ctx , {
                      type: "bar",
                      data: data,
                    });
                  },

                  friday: function(arr){
                    var canvas = document.getElementById("fri");
                    var ctx = canvas.getContext("2d");

                    var hours = []
                    for(var i = 0; i < 25; i++) {
                      if((i >= arr.start) && (i <= arr.end)){
                        hours.push(1)
                      } else {
                        hours.push(0)
                      }
                    }

                    var data = {
                      labels: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'],
                      datasets: [
                        {
                          label: "Friday",
                          data: hours
                        }]};

                      var fridayChart = new Chart(ctx , {
                        type: "bar",
                        data: data,
                      });
                    },

                    saturday: function(arr){
                      var canvas = document.getElementById("sat");
                      var ctx = canvas.getContext("2d");

                      var hours = []
                      for(var i = 0; i < 25; i++) {
                        if((i >= arr.start) && (i <= arr.end)){
                          hours.push(1)
                        } else {
                          hours.push(0)
                        }
                      }

                      var data = {
                        labels: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'],
                        datasets: [
                          {
                            label: "Saturday",
                            data: hours
                          }]};

                        var saturdayChart = new Chart(ctx , {
                          type: "bar",
                          data: data,
                        });
                      },

                      sunday: function(arr){
                        var canvas = document.getElementById("sun");
                        var ctx = canvas.getContext("2d");

                        var hours = []
                        for(var i = 0; i < 25; i++) {
                          if((i >= arr.start) && (i <= arr.end)){
                            hours.push(1)
                          } else {
                            hours.push(0)
                          }
                        }

                        var data = {
                          labels: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'],
                          datasets: [
                            {
                              label: "Sunday",
                              data: hours
                            }]};

                          var sundayChart = new Chart(ctx , {
                            type: "bar",
                            data: data,
                          });
                        }
        }
      }

















      // Vue.component('monday', {
      //   extends: VueChartJs.Bar,
      //   mounted () {
      //     this.renderChart({
      //       labels: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'],
      //       datasets: [
      //         {
      //           label: 'Monday',
      //           backgroundColor: '#129762',
      //           data: this.monday()
      //         }
      //       ]
      //     }, {responsive: true, maintainAspectRatio: false})
      //   }
      // })
      // ,
      // Vue.component('tuesday', {
      //   extends: VueChartJs.Bar,
      //   mounted () {
      //     this.renderChart({
      //       labels: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'],
      //       datasets: [
      //         {
      //           label: 'Tuesday',
      //           backgroundColor: '#5a0f46',
      //           data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
      //         }
      //       ]
      //     }, {responsive: true, maintainAspectRatio: false})
      //   }
      // }),
      // Vue.component('wednesday', {
      //   extends: VueChartJs.Bar,
      //   mounted () {
      //     this.renderChart({
      //       labels: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'],
      //       datasets: [
      //         {
      //           label: 'Wednesday',
      //           backgroundColor: '#6988e6',
      //           data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
      //         }
      //       ]
      //     }, {responsive: true, maintainAspectRatio: false})
      //   }
      // }),
      // Vue.component('thursday', {
      //   extends: VueChartJs.Bar,
      //   mounted () {
      //     this.renderChart({
      //       labels: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'],
      //       datasets: [
      //         {
      //           label: 'Thursday',
      //           backgroundColor: '#1c118e',
      //           data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
      //         }
      //       ]
      //     }, {responsive: true, maintainAspectRatio: false})
      //   }
      // }),
      // Vue.component('friday', {
      //   extends: VueChartJs.Bar,
      //   mounted () {
      //     this.renderChart({
      //       labels: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'],
      //       datasets: [
      //         {
      //           label: 'Friday',
      //           backgroundColor: '#b57238',
      //           data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
      //         }
      //       ]
      //     }, {responsive: true, maintainAspectRatio: false})
      //   }
      // }),
      // Vue.component('saturday', {
      //   extends: VueChartJs.Bar,
      //   mounted () {
      //     this.renderChart({
      //       labels: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'],
      //       datasets: [
      //         {
      //           label: 'Saturday',
      //           backgroundColor: '#6917fb',
      //           data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
      //         }
      //       ]
      //     }, {responsive: true, maintainAspectRatio: false})
      //   }
      // }),
      // Vue.component('sunday', {
      //   extends: VueChartJs.Bar,
      //   mounted () {
      //     this.renderChart({
      //       labels: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'],
      //       datasets: [
      //         {
      //           label: 'Sunday',
      //           backgroundColor: '#2f5674',
      //           data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
      //         }
      //       ]
      //     }, {responsive: true, maintainAspectRatio: false})
      //   }
      // })
</script>

<style lang="css">
</style>
