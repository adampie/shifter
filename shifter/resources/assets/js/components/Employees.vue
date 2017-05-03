<template>
  <div class="panel panel-default">
    <div class="panel-heading">Employees
        <a href="#" class="btn pull-right btn-xs btn-primary"><span class="glyphicon glyphicon-plus"></span></a>
    </div>
    <div class="panel-body">
      <div v-for="employee in employees">
       {{ employee.name }}
      </div>
    </div>
  </div>
</template>

<script>
export default {
        data() {
          return {
            employees: [{
              id: '1',
              name: 'test'
            },
            {
              id: '2',
              name: 'test2'
            }
          ]
            //employees: this.readEmployees()
          }
        },

        methods: {
          createEmployee () {
            axios.post('/api/v1/employee/adam/pie');
          },
          readEmployees () {
            var employees = axios.get('/api/v1/employee');
            if(employees.length != 0){
              //RETURN ARRAY HERE
              return (employees.length);
            }
          },
          updateEmployee () {
            axios.post('/api/v1/employee/1/a/p');
          },
          deleteEmployee () {
            axios.post('/api/v1/employee/1');
          }
        }
      }
</script>

<style lang="css">
</style>
