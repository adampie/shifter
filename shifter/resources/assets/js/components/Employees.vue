<template>
  <div class="panel panel-default">
    <div class="panel-heading">Employees
        <a data-toggle="modal" href="#addEmployee" class="btn pull-right btn-xs btn-primary"><span class="glyphicon glyphicon-plus"></span></a>
        <!--  -->
        <div id="addEmployee" class="modal fade" role="dialog">
        <div class="modal-dialog">
          <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Add Employee</h4>
      </div>
      <div class="modal-body">
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
        <a @click="createEmployee(fname,lname)" data-dismiss="modal" href="/dashboard" class="btn btn-primary btn-success">Add Employee</a>
      </div>
    </div>
        </div>
      </div>
    </div>
    <div class="panel-body">
      <table class="table">
    <thead>
      <tr>
        <th>Name</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="employee in employees">
        <td>{{employee.firstname}} {{employee.lastname}}</td>
        <td>
          <a @click="deleteEmployee(employee.id)" href="/dashboard" class="btn pull-right btn-xs btn-danger"><span class="glyphicon glyphicon-remove"></span></a>
          <!-- <a @click="test('edit-test')" href="#" class="btn pull-right btn-xs btn-warning"><span class="glyphicon glyphicon-edit"></span></a> -->
        </td>
      </tr>
    </tbody>
  </table>
  </div>
  </div>






</template>

<script>
export default {
        data() {
          return {
            employees: [],
            fname: "",
            lname: ""
          }
        },

         mounted() {
           this.readEmployees()
         },

        methods: {
          createEmployee: function(fname, lname) {
            axios.post('/api/v1/employee/'+fname+'/'+lname)
            this.readEmployees()
          },
          readEmployees () {
            axios.get('/api/v1/employee').then( response => {
              if(response.data.length != 0){
                this.employees = response.data
              }
            });
          },
          updateEmployee: function(id, fname, lname) {
            axios.post('/api/v1/employee/'+id+'/'+fname+'/'+lname)
            this.readEmployees()
          },
          deleteEmployee: function(id) {
            console.log("id = "+id)
            axios.post('/api/v1/employee/'+id)
            this.readEmployees()
          }
        }
      }
</script>

<style lang="css">
</style>
