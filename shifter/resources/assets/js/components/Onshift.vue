<template>
  <div class="panel panel-default">
      <div class="panel-heading">On Shift
        <a data-toggle="modal" href="#addShiftWorkers" class="btn pull-right btn-xs btn-primary"><span class="glyphicon glyphicon-plus"></span></a>
        <div id="addShiftWorkers" class="modal fade" role="dialog">
          <div class="modal-dialog">
            <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Add Shift Workers</h4>
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
    <label for="fname">First Name:</label>
    <input  v-model="fname" type="text" class="form-control" id="fname">
  </div>
  <div class="form-group">
    <label for="text">Last Name:</label>
    <input v-model="lname" type="text" class="form-control" id="lname">
  </div>
</div>
<div class="modal-footer">
  <a href="/dashboard" data-dismiss="modal" class="btn btn-primary btn-danger">Cancel</a>
  <a @click="createShiftWorkers(day, fname,lname)" data-dismiss="modal" href="/dashboard" class="btn btn-primary btn-success">Add Employee</a>
</div>
</div>
</div>
      </div>
        <div
      <div class="panel-body">






      </div>
  </div>
</div>
</template>

<script>
export default {
        data() {
          return {
            shiftworkers: [],
            day: null,
            fname: null,
            lname: null
          }
        },

         mounted() {
           this.readShiftWorkers()
         },

        methods: {
          createShiftWorkers: function(day,fname,lname) {
            axios.post('/api/v1/shiftworker/adam/pie');
          },
          readShiftWorkers () {
            axios.get('/api/v1/shiftworker').then( response => {
              if(response.data.length != 0){
                this.shiftworkers = response.data
              }
            });
          },
          updateShiftWorkers () {
            axios.post('/api/v1/shiftworker/1/a/p');
          },
          deleteShiftWorkers () {
            axios.post('/api/v1/shiftworker/1');
          }
        }
      }
</script>

<style lang="css">
</style>
